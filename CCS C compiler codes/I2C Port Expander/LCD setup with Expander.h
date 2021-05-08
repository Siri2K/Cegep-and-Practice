int dev_address, reg, data; // Values devices address , register address and data value
int IODIR, IOCON, GPIO; // Expander address 
int Expander_Address; // device address channel

void expander_write(int dev_address, int reg, int data); // Function to write data to PIC16F887

// LED setup functions
void flash (void); // Flashing LED function 

// LCD setup functions
void pulse (void); // Enable pin Pulse function
void com_split_byte (int data_val);    // Split byte function for RS = 0 -- LCD command mode
void com_set_pins(int data_val);       // Set_pins function when RS = 0 -- LCD command mode
void char_split_byte (int data_val);  // Split byte function for RS = 1 -- LCD character mode
void char_set_pins(int data_val);     // Set_pins function when RS = 1 -- LCD character mode

// LCD commands and character
void Initialize (void);    // Functiion to setup to write to the LCD
void LCD_clear (void);     // Command to clear all LCD display
void LCD_space (void);   // Function to write the space character 5x

int expander_read(int dev_address, int reg)
{
int16 scratch;
i2c_start(); // Start  waveform
i2c_write(0x40 | (dev_address<<1)); // Device address waveform
i2c_write(reg); // Register waveform
i2c_start(); // start again waveform
i2c_write(0x41 | (dev_address<<1)); // Device address waveform
i2c_stop(); // Stop waveform
scratch = i2c_read (0);
return scratch;
}

void expander_write(int dev_address, int reg, int data)
{
i2c_start(); // Start waveform
i2c_write(0x40 | (dev_address<<1)); // Device address waveform
i2c_write(reg); // Register address waveform
i2c_write(data); // Data sddress waveform
i2c_stop(); // Stop waveform
}

void flash (void)
{
data = data|0x80; // xxxx xxxx OR 1000 0000 = 1xxx xxxx 
expander_write(Expander_Address, GPIO , data); // GP7 =1
delay_ms(500);
data = data & 0x7F; // xxxx xxxx AND 0111 1111 = 0xxx xxxx
expander_write(Expander_Address, GPIO , data); // GP7 = 0
delay_ms(500);
}

void pulse (void) 
{
delay_ms(10);
data = data & 0xBF;// xxxx xxxx AND 1011 1111 = x0xx xxxx
expander_write(Expander_Address, GPIO , data); // GP6 = 0
delay_ms(10);
}

void com_split_byte (int data_val)
{
com_set_pins ((data_val & 0xf0)>>4); // Data_val = (xxxx xxxx AND 1111 0000) >>4 
                                     //= xxxx 0000 >>4 = 0000 xxxx -- Most significant 4 bits
delay_ms(20);
com_set_pins (data_val & 0x0f); // Data_val = xxxx xxxx AND 0000 1111 
                                // Data_val = 0000 xxxx -- Least Significant 4 bits
delay_ms(20);
}

void com_set_pins(int data_val)
{
data = data_val|0x40; // xxxx xxxx OR 0100 000 = x1x0 xxxx 
expander_write(Expander_Address, GPIO , data); // GP6 = 1 and GP4 = 0
pulse(); 
}

void char_split_byte (int data_val)
{
char_set_pins ((data_val & 0xf0)>>4); // Data_val = (xxxx xxxx AND 1111 0000) >>4 
                                      // Data_val = xxxx 0000 >>4 = 0000 xxxx -- Most significant 4 bits
delay_ms(20);
char_set_pins (data_val & 0x0f); // Data_val = xxxx xxxx AND 0000 1111 
                                 // Data_val = 0000 xxxx -- Least Significant 4 bits
delay_ms(20);
}

void char_set_pins(int data_val)
{
data = data_val|0x50; // xxxx xxxx OR 0101 000 = x1x1 xxxx 
expander_write(Expander_Address, GPIO , data); // GP6 = 1 and GP4 = 1
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
com_split_byte(0x01); // Clear command
}

void LCD_space (void)
{
int i;
for (i=0 ; i<=4 ; i++) // Perform space 4x
   {
   char_split_byte(0x20); // Space character
   }
}


