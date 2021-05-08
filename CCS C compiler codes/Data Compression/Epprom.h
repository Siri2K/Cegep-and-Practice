int add, adc_val, epprom_val; // address , POT value
int16 loc_add, scratch;

void write_epprom (int add , int16 loc_add , int adc_val);  // Function used for EPPROM to store POT values into an address

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

