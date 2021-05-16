using System;

namespace C__codes
{
    class  Program{
       static void Main(string [] args){
           String name;

           name = Console.ReadLine();
           Console.WriteLine(SayHi(name));
           
       }

       static String SayHi(String name){
           return "Hello " + name;
       }
   }
}