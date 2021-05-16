using System;

namespace C__codes
{
    class  Program{
       static void Main(string [] args){
           // Declare variables
           String srow;
           int row = 0;
           int column = 0;

           // Input variables
           srow = Console.ReadLine();
           Int32.TryParse(srow, out row);
           column = (2*row)-1;

           // Process inputs
           for(int i = 1; i<=row;i++){
             for(int j = 1; j<=column;j++){
                 if(j>=row-(i-1)&&j<=row+(i-1)){
                     Console.Write("*");
                 }
                 else{
                    Console.Write(" "); 
                 }
            }
            Console.Write("\n");
           }
       }
   }
}