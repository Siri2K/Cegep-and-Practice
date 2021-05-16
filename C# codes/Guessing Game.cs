using System;

namespace C__codes
{
    class  Program{
        static void Main(string[] args){
          // Initialize secret variables
          string secretword = "Dentist";
          string guess = "";
          int i = 0;

            while(guess != secretword){
                guess = Console.ReadLine();

                if(++i>=3){
                    Console.Write("The Secret Word is: Dentist");
                    break;
                }
            }
        }   
    }
}