int16 frac_val, temp_value; // Temperature
int msb, lsb;

void temperature(void); // Function Prototype used to measure temperature

int16 read_16_bit_temp(int add) // Value of 16 bit temperature number
{
int msb,lsb; // Most and Least significant 8 digits of the I2C 16 digits
int16 scratch; // Disposable value

i2c_start(); // Start Command of the waveform
i2c_write(0x90 | (add<<1)); // Write waveform command
i2c_write(0x00); // Write waveform command
i2c_start(); // Start Command of the waveform 
i2c_write(0x91 | (add<<1)); // Write waveform command
msb = i2c_read(); // Value of the MSB portion of the I2C
lsb = i2c_read(0);// Value of the LSB portion of the I2C
i2c_stop(); // Stop Command of the waveform 
scratch = msb <<8; // Move msb by 8 bits
return scratch;
}

void temperature(void)
{
temp_value = read_16_bit_temp(0x00); // 16-bit code value of the temperature 

   if (temp_value & 0x8000) // Function check if value is negative
   {
   temp_value = (temp_value^0xFFFF) +1; // Use 2's complements
   }

   frac_val = (((lsb&0x80)/0x80)*500 + ((lsb&0x40)/0x40)*250 + ((lsb&0x20)/0x20)*125); 
}

