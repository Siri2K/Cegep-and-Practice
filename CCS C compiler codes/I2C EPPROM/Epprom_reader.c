#include <Epprom_reader.h>
#include <AD_Trainer_Number.h> // Header file for LCD number code
#byte PORTC = 0x07 // LED PORT
#byte TRISC = 0x87 // LED TRISTATE
#bit SDA = 0x7.4 
#bit SCL = 0x7.3
#bit LED_Write = 0x7.1 // LED to check if data is sent to the EPPROM
#bit LED_Read = 0x7.2 // LED checks if Epprom va;lues read
#bit SW_Write = 0x5.1 // Write Switch
#bit SW_Read = 0x5.2 // Read Switch

int add, adc_val, epprom_val; // address , POT value
int16 loc_add, scratch;

void write_Analog (void); // Function that uses the write functions of the epprom
void read_Analog (void); // Function that uses the  read functions of the epprom
void write_EPPROM (int add , int16 loc_add , int adc_val);  // Function used for EPPROM to store POT values into an address 

int read_epprom(int add, int16 loc_add) // Function used for Microchip to read EPPROM address values
{
int16 scratch;

i2c_start(); // Start Command of the waveform
i2c_write(0xA0 | (add<<1)); // Write waveform command
i2c_write((loc_add & 0xFF00)>>8); 
i2c_write(loc_add & 0x00FF); 
i2c_start(); // Start Command of the waveform 
i2c_write(0xA1 | (add<<1)); // Write waveform command
scratch = i2c_read(0);
i2c_stop(); // Stop waveform
return scratch;
}

void write_EPPROM (int add , int16 loc_add , int adc_val) // Function used for EPPROM to store POT values into an address 
{
i2c_start(); // Start Command of the waveform
i2c_write(0xA0 | (add<<1)); // Write waveform command
i2c_write((loc_add & 0xFF00)>>8); 
i2c_write(loc_add & 0x00FF); 
i2c_write(adc_val); // Start Command of the waveform 
i2c_stop(); // Stop waveform
}

void write_Analog (void)
{
adc_val = read_adc();
write_EPPROM(0,add,adc_val);
}

void read_Analog (void)
{
RS = 0;
clear();

epprom_val = read_epprom(0,add); // Look at data in address  

RS = 1;
number(epprom_val); // display scratch value

}

void main(void) // MAin setup function
{
setup_adc_ports(sAN0); // Potentionemeter port
setup_adc(ADC_CLOCK_INTERNAL); // Clock channel
set_adc_channel(0); // Potentionemeter channel at RA0

TRISD = 0xA0; // 1010 0000 All pins except D7 and D5 are inputs
TRISC = 0xFC; // 1111 1100 Only Pin C0 is an output

command();

   while(TRUE)
   {
      if (SW_Write == 1) // Write POT values to EPPROM at each address
      {
      LED_Write = 1;
      write_Analog();
      }
      
      if (SW_Read == 1) // Display EPPROM values to LCD at each address
      {  
      LED_Read = 1;
      read_Analog();
      }
   }
}
