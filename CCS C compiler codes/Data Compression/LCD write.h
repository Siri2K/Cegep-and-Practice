#byte TRISD = 0x88
#byte PORTD = 0x08
int h,t,o;

void pulse (void); // Enable pin Pulse function

// LCD NIbble mode
void com_split_byte (int data_val); // Split byte function for RS = 0 -- LCD command mode
void com_set_pins(int data_val); // Set_pins function when RS = 0 -- LCD command mode
void char_split_byte (int data_val);// Split byte function for RS = 1 -- LCD character mode
void char_set_pins(int data_val);  // Set_pins function when RS = 1 -- LCD character mode

// LCD commands and character
void Initialize (void); // Functiion to setup to write to the LCD
void LCD_clear (void); // Command to clear all LCD display
void number (int16 num); // Function to write the number    

void pulse (void) 
{
delay_ms(10);
PORTD = PORTD & 0xBF; // PORTD = xxxx xxxx AND x0xx xxxx = x0xx xxxx -- EN = 0
delay_ms(10);
}

void com_split_byte (int data_val)
{
com_set_pins ((data_val & 0xf0)>>4); // Data_val = (xxxx xxxx AND 1111 0000) >>4 = xxxx 0000 >>4 = 0000 xxxx -- Most significant 4 bits
delay_ms(20);
com_set_pins (data_val & 0x0f); // Data_val = xxxx xxxx AND 0000 1111 = 0000 xxxx -- Least Significant 4 bits
delay_ms(20);
}

void com_set_pins(int data_val)
{
PORTD = data_val | 0x40; // xxxx xxxx OR x1x0 xxxx = x1x0 xxxx --- EN = 1 and RS = 0
pulse(); 
}

void char_split_byte (int data_val)
{
char_set_pins ((data_val & 0xf0)>>4); // Data_val = (xxxx xxxx AND 1111 0000) >>4 = xxxx 0000 >>4 = 0000 xxxx -- Most significant 4 bits
delay_ms(20);
char_set_pins (data_val & 0x0f); // Data_val = xxxx xxxx AND 0000 1111 = 0000 xxxx -- Least Significant 4 bits
delay_ms(20);
}

void char_set_pins(int data_val)
{
PORTD = data_val | 0x50; // xxxx xxxx OR x1x1 xxxx = x1x1 xxxx --- EN = 1 and RS = 1
pulse(); 
}

void Initialize (void)
{
com_split_byte(0x03); // Command for Cursor
com_split_byte(0x03); 
com_split_byte(0x03);
com_split_byte(0x02); // Command to Display 
com_split_byte(0x0F); // Display Cursor
}

void LCD_clear (void)
{
com_split_byte(0x01);
}

void number (int16 num) // loop meant to zero out the counter at a given numerical value
{
h  = 0x30+num/100;
t  = 0x30+(num%100)/10;
o  = 0x30+num%10;

char_split_byte(h);
char_split_byte(t);
char_split_byte(o);

}
