#include <Part 2.h>
#include <LCD number+ text display.h>

int16 temp_val;
int msb, lsb ;

void temperature (int16 temp_val);

int16 read_16_bit_temp(int dev_add) // Value of 16 bit temperature number
{
int16 scratch; // Disposable value

i2c_start(); // Start Command 
i2c_write(0x90 | (dev_add<<1)); // Assign 8 unique addresses
i2c_write(0x00); // pointer temperature register
i2c_start(); // Start Command 
i2c_write(0x91 | (dev_add<<1)); // Write waveform command
msb = i2c_read(); // Value of the MSB 
lsb = i2c_read(0);// Value of the LSB 
i2c_stop(); // Stop Command of the waveform 
scratch = (msb <<8) | lsb; // Move msb by 8 bits
return scratch;
}

void temperature (int16 temp_val)
{ 
int frac_val;

   if (temp_val & 0x8000) // Function check if value is negative
   {
   temp_val = (temp_val^0xFFFF) +1; // Use 2's complements
   }

   frac_val =((lsb&0x80)/0x80)*500 + ((lsb&0x40)/0x40)*250 + ((lsb&0x20)/0x20)*125; 

   RS = 1;
   number(msb); // First 8-bit portion conversion to 4-bit and displayed on the LCD
   split_byte(0x2E); // "." displayed on the LCD
   number(frac_val); // Last 8-bit portion conversion to 4-bit and displayed on the LCD   
}



void main(void)
{
TRISD = 0xA0;

Initialize();

while(TRUE)
   {
    temperature(read_16_bit_temp(0x00));
    delay_ms(500);
    clear(); // Clear display every 0.5s
   }

}
