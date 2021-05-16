using System;

namespace C__codes
{
    class  Program{
       static void Main(string [] args){
           int [] Luckynumbers = {1,2,3,4,5};

           for(int i=0;i<Luckynumbers.Length;i++){
               Console.Write(Luckynumbers[i]);
               Console.Write(" ");
           }
           Console.WriteLine(" ");

           for(int i=5;i<10;i++){
               Luckynumbers[i-5]*=i;
           }

           for(int i=0;i<Luckynumbers.Length;i++){
               Console.Write(Luckynumbers[i]);
               Console.Write(" ");
           }
       }
   }
}