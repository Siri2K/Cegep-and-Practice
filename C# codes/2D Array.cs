using System;

namespace C__codes
{
    class  Program{
        
        static void Main(string[] args){
            int [,]Numbergrid={
                {0,0,0,0,0,0,0,0},
                {0,0,0,0,0,0,0,0},
                {0,0,0,0,0,0,0,0},
                {0,0,0,0,0,0,0,0},
                {0,0,0,0,0,0,0,0},
                {0,0,0,0,0,0,0,0},
                {0,0,0,0,0,0,0,0},
                {0,0,0,0,0,0,0,0}
            };

            for(int i = 0;i < 8;i++){
                for(int j = 0;j< 8;j++){
                    Numbergrid[i,j] = i+j;
                }
            }

            Console.Write(Numbergrid[4,4]);
        } 
    }
}