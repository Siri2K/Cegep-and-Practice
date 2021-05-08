#include <I2C_Data_compression_part2.h>
#include <Epprom.h>
#include <LCD write.h>
#include <Temperature Sensor.h>

int16 temp_val,neg; // Temperature value and Sign bit value
int16 decomp,data_16_bit,unzip_val; // 16 bit data and Decompressed data value
int comp,data_8_bit,zip_val; // 8 bit data and Compressed data value

int compress (int16 data_16_bit); // 16-bit integer compression function
int16 expand (int data_8_bit); // 8-bit interger expansion function

void data_packing(int16 comp); // Function to store compressed value to Epprom
void data_unpacking (int8 decomp); // Function to expand stored epprom value 
void display (int16 display_data); // Function to Display Expanded value to LCD

int compress (int16 data_16_bit) 
{
int16 sign,whole,frac; // Bits to Isolate
int zip;

sign  = (data_16_bit & 0x8000)>>8; // Move Bit15 of 16 bit data to Bit7 
whole = (data_16_bit & 0x3F00)>>7; // Move Bit8-Bit13 of 16 bit data to Bit1-Bit6 
frac  = (data_16_bit & 0x0080)>>7; // Move Bit7 of 16 bit data to Bit0 

zip = (sign|whole|frac); // Store sign bit, whole bit and frac bit to 1 8 bit value 
return zip;
}

int16 expand (int data_8_bit) 
{
int16 sign,whole,frac,unzip;

data_16_bit = (data_8_bit | 0x0000) & 0x00FF;  // Change 8-bit data to a 16-bit data

sign  = (data_16_bit & 0x0080)<<8; // Move Bit7 of 16 bit data to Bit15 
whole = (data_16_bit & 0x007E)<<7; // Move Bit1-Bit6 of 16 bit data to Bit8-Bit13
frac  = (data_16_bit & 0x0001)<<7; // Move Bit0 of 16 bit data to Bit7 

unzip = (sign|whole|frac); // Store sign bit, whole bit and frac bit to 1 16-bit value 
return unzip;
}

void data_packing(int16 comp)
{
zip_val = compress(comp); // Compressed temperature value
delay_us(100);
write_epprom (0 ,loc_add , zip_val);
}

void data_unpacking(int8 decomp)
{
unzip_val = expand(decomp); // Expand Epprom value
delay_us(100);
display(unzip_val); // Display expanded value
}

void display (int16 display_data)
{
int16 whole,decimal; // LCD portions of values to display

neg = display_data & 0x8000; // Sign bit check

   if (neg == 0x8000) // Function check if value is negative
   {
   display_data = ((~display_data)&0x3F80)+1; // 2's complement for bits used
   char_split_byte(0x2D);
   }

whole = (display_data&0x3F00)>>8; // Whole number to display to LCD
decimal = ((display_data&0x0080)/0x0080)*500; // Decimal value to display to LCD
number(whole);
char_split_byte(0x2E);
number(decimal);
}

void main(void)
{
TRISD= 0xA0;
Initialize();
LCD_clear();
    while (TRUE)
    {
      for (loc_add=0;loc_add<=25;loc_add++)
      {
       temp_val = read_16_bit_temp(0x00); // Read temperature sensor value
       data_packing(temp_val); // Compress temperature reading and store to Epprom
       delay_ms(100);
       data_unpacking(read_epprom (0,loc_add)); // Expand Epprom value and display to LCD
       delay_ms(100);
       LCD_clear();
      }
    }
}
