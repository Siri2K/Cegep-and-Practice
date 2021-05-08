int16 read_16_bit_temp(int dev_add) // Value of 16 bit temperature number
{
int16 msb, lsb;
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


