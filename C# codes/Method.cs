using System;

namespace C__codes
{
    class  Program{
       static void Main(string [] args){
           String name;

           name = Console.ReadLine();
           SayHi(name);
       }

       static void SayHi(String name){
           Console.Write("Hello "+name);
       }
   }
}