#include <Part 2.h>
#include <LCD setup with Expander.h>

void LCD_Text (void);

void LCD_Text (void)
{
   LCD_space(); // Space character function

   char_split_byte(0x68); // h character being split to 4-bit
   char_split_byte(0x65); // e character being split to 4-bit
   char_split_byte(0x6C); // l character being split to 4-bit
   char_split_byte(0x6C); // l character being split to 4-bit
   char_split_byte(0x6F); // o character being split to 4-bit
   
   com_split_byte(0xC0); // Move to next line command

   LCD_space(); // Space character function
   
   char_split_byte(0x77); // W character being split to 4-bit
   char_split_byte(0x6F); // O character being split to 4-bit
   char_split_byte(0x72); // R character being split to 4-bit
   char_split_byte(0x6C); // L character being split to 4-bit
   char_split_byte(0x64); // D character being split to 4-bit
}

void main(void)
{
IODIR = 0x00; // TRIS Address
GPIO = 0x09; // PORT address
IOCON = 0x05; // i/0 configuration address
Expander_Address= 0x00; // Base device address

expander_write(Expander_Address, IOCON, 0x20); // 0010 0000 --- NO auto increment
expander_write(Expander_Address, IODIR, 0x00); // 0000 0000 --- All pins are outputs

Initialize(); // Setup LCD commands and prep for characters

   while(TRUE)
   {
   LCD_Clear(); // Clear LCD display
   LCD_Text(); // Type Hello _World
   flash(); // Flash LED
   }

}

