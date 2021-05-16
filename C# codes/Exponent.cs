using System;

namespace C__codes
{
    class  Program{
        static void Main(string[] args){
          // Declare Variable
          int baseNum;
          int powNum;

          // read Inputs
          baseNum = Convert.ToInt32(Console.ReadLine());
          powNum = Convert.ToInt32(Console.ReadLine());

          // Process value
          Console.Write(GetPow(baseNum,powNum));
        }

        static int GetPow (int baseNum , int powNum){
            int power = 1;

            for(int i = powNum;i>0;i--){
                 power*=baseNum;
            }
            return power;
        }   
    }
}