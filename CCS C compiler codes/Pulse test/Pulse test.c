#include <Pulse test.h>
#bit LCD_RS = 0x06.4 // Register select PORT B
#bit LCD_EN = 0x06.6 // Enable PORT B
#byte PORTC =0x07 // Data pins on PORT C
#byte TRISC =0x87 

void pulse (void);

void pulse(void)
{
   LCD_EN = 1;
   delay_ms(10);
   LCD_EN = 0;
   delay_ms(10);
}

void main (void)
{
   while(TRUE)
   {
   pulse();
   }
}


