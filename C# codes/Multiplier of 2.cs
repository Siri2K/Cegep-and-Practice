using System;

namespace C__codes
{
    class  Program{
        static void Main(string[] args){
            // Declare and Initialize variables
            int i = 0;
            int num = 0;

            // Input Number 
            num = Convert.ToInt32(Console.ReadLine());

            // Process
            while(num%2 ==0){
                i++;
                num = number(num);

                if(num ==0 || num%2 ==1){
                    break;
                }
            }
            Console.WriteLine(i);

        }   
        static int number (int num){
            return num/2;
        }
    }
}