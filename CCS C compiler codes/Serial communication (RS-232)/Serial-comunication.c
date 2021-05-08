#include <Serial-comunication.h>
#include <Temperature.h> // Header file for Temperature Sensor

int value, data; // RS232 integers

void PC_Com (void); // Function to communicate to the RS232 port
void menu (void); // Function to write a make a menu screen in the RS232 serial monitor

#INT_RDA
void  RDA_isr(void) 
{
value = getc(); // ASCII value of keyboard button
data = 1; // Type to the RS232 port
}

void PC_Com (void)
{
   if (data == 1) // When we press the keybind
   {
   printf("%c", value); // Type keybind character in RS232 serial monitor
   data = 0;
   delay_ms(15);
    
   if (value == 49) // When we press 1 keybind 
   {
   printf("\n"); // Next line 
   printf("\r"); // Character return on the same line.
   printf("Temperature = %d", msb); // Display temperature
   printf("\n"); // Next line 
   printf("\r"); // Character return on the same line
   temperature();
   }
      
   if (value == 50)
   {
   printf("\n"); // Next line 
   printf("\r"); // Character return on the same line
   printf("Analog = %d", read_adc()); // Analog value on RS232 port
   printf("\n"); // Next line 
   printf("\r"); // Character return on the same line
   }
   }
}

void menu (void)
{
printf("Press 1 for Temperature\n"); // Option 1 fir temperature and next line
printf("\r"); //  return to the start of the line
printf("Press 2 for Analog\n"); // Option 2 for analog and next line
printf("\r"); //  return to the start of the line
delay_ms(15);
}

void main(void)
{
setup_adc_ports(sAN0);
setup_adc(ADC_CLOCK_INTERNAL);
set_adc_channel(0); // Potentionemeter channel at RA0

enable_interrupts(INT_RDA);
enable_interrupts(GLOBAL);
delay_ms(1000);
menu(); // Menu screen function
   
   while (TRUE)
   {
   PC_com(); // Type to RS232 function
   }
}

