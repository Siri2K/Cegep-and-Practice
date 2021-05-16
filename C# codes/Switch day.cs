using System;

namespace C__codes
{
    class  Program{
        static void Main(string[] args){
            int dayNum = Convert.ToInt32(Console.ReadLine());
            Console.Write(Getday(dayNum));
        }

        static String Getday (int day){
            switch (day)
            {   case 1:
                return "Monday";

                case 2:
                return "Tuesday";

                case 3:
                return "Wednesday";

                case 4:
                return "Thursday";

                case 5:
                return "Friday";

                case 6:
                return "Saturday";

                case 7:
                return "Sunday";
                
                default:
                return "Invalid day number";
            }
        }
            
    }
}