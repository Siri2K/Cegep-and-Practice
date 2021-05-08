#byte PORTD = 0x08
#byte TRISD = 0x88
#bit LED = 0x08.3
#bit D4_LCD = 0x08.0   //D4 to RD0
#bit D5_LCD = 0x08.1   //D5 to RD1
#bit D6_LCD = 0x08.2   //D6 to RD2
#bit D7_LCD = 0x08.3   //D7 to RD3
#bit RS = 0x08.4   //RS to RD4
#bit EN = 0x08.6   //EN to RD6
int o; // hundreth digit
int t; // hundreth digit
int h; // hundreth digit


void pulse(void); // Enable pulse function prototype
void split_byte(int data_val); // Function Prototype used to break 8 bit-mode to 4 bit-mode
void set_pins(int data_val); // Function prototype to ensure Enable and RS are not affected by nibble mode
void Initialize(void); // Function prototypes used to list all LCD Commands used
void number (int num); // Function Prototype use to step down each digit and display the number on the LCD

void pulse(void) // Enable pin pulse
{
EN = 1;
delay_ms(10);
EN = 0;
delay_ms(10);
}

void set_pins(int data_val)
{
if( data_val & 0x08) D7_LCD=1; else D7_LCD=0; // check if data_val in C3 = 1
if( data_val & 0x04) D6_LCD=1; else D6_LCD=0; // check if data_val in C2 = 1
if( data_val & 0x02) D5_LCD=1; else D5_LCD=0; // check if data_val in C1 = 1
if( data_val & 0x01) D4_LCD=1; else D4_LCD=0; // check if data_val in C0 = 1
delay_ms(10);// let the data levels settle before pulse();
pulse();
}

void split_byte(int data_val)
{
set_pins ((data_val&0xf0)>>4); // Upper nibble byte
delay_ms(20);
set_pins (data_val&0x0f); // Lower nibble
delay_ms(20);
}

void clear(void)
{
RS = 0;
split_byte(0x01); // Command to clear previous display character
}

void number (int num)
{
o = 0x30 + num%10;
t = 0x30 + (num/10)%10;
h = 0x30 + num/100;

RS = 1;
split_byte(h);
split_byte(t);
split_byte(o);
}


void Initialize (void) // Commands for this function are done in 8-bit mode
{
   RS = 0; // Command Mode
   split_byte(0x03); // Command for Cursor
   split_byte(0x03); 
   split_byte(0x03);
   split_byte(0x02); // Command to Display 
   clear();
   split_byte(0x0F); // Display Cursor
}


