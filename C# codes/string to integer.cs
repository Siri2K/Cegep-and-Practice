using System;

namespace C__codes{
    class  Program{
       static void Main(string [] args){
           // Declare Variables
           string snum;
           int inum;
           
           // Input variables
           Console.WriteLine("Enter a string");
           snum = Console.ReadLine();

           // Process Inputs
           inum = Int16.Parse(snum);

           // Print Output
           Console.WriteLine(inum);
       }
   }
}
