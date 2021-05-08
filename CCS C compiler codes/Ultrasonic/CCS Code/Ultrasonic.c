#include <main.h>
#include <LCD write.h> //LCD header file

#define NO_Echo 1000
#define Too_far 50000 

#byte TRISB = 0x86 
#byte PORTB = 0x06 // PORT used for ultrasonic
#bit Trigger = 0x6.0 // Trigger pin
#bit Echo = 0x6.1 // Echo pin
#bit Sys_Error = 0x6.2 // LED signalling that there is an error
#bit out_of_range = 0x6.3 // LED signaling object is out of range

int16 distance; // Object Distance variable

void Detection (void); // Ultrasonic detection loop
void Ultrasonic_Pulse(void); // Trigger pulse function
void Sensor(int16 sensor_val); // LCD object distance display function 

void main(void)
{
TRISB = 0xF2; // Ultrasonincs sensor pin ---> 1111 0010 ---> B0,B5,B7 are output pins
TRISD = 0xA0; // LCD output pin setup ---> 1010 0000 ---> D7 and D5 are not used

setup_timer_1(T1_INTERNAL|T1_DIV_BY_4); //52.4 ms overflow

Initialize(); // INitialize LCD and setup character dispaly
LCD_clear(); // Clear LCD screen
delay_ms(100);

   while(TRUE)
   {
   Detection(); 
   delay_ms(500);
   LCD_clear();
   }
}

void Detection (void)
{
Sys_Error=0; 
Ultrasonic_Pulse();
set_timer1(0); //Reset timer

   while ((Echo == 0) && (get_timer1() < NO_Echo)); // Lock here, when Echo is 0
   if(get_timer1() > NO_Echo) // Error if timer value  occur when Echo = 0
   {
   Sys_Error = 1;
   }
   set_timer1(0);
   
   if (Sys_Error == 0)
   {
   while ((Echo == 1) && (get_timer1() < Too_far));
   if(get_timer1() > Too_far)
   {
   out_of_range = 1;
   }
   
   else
   out_of_range = 0;
   Sensor(get_timer1()); // Dsiplay value to LCD
   }  
}

void Ultrasonic_Pulse(void) // Ultrasonic 10ms trigger pulse
{
Trigger = 0;
delay_us(5);
Trigger = 1;
delay_us(5);
}

void Sensor(int16 sensor_val)
{
distance = sensor_val*2/15; // Convert timer_value to distance
number(distance); // Display
char_split_byte (0x6d); // Character for mm
char_split_byte (0x6d); // Character for mm
}
