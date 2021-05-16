using System;

namespace C__codes
{
    class  Program{
        static void Main(string[] args)
        {
            // Variables
            int num1;
            int num2;
            String op;

            // Input variables
            num1 = Convert.ToInt32(Console.ReadLine());
            op = Console.ReadLine();
            num2= Convert.ToInt32(Console.ReadLine());
            Console.Write("\n\n");

            // Print output
            Console.WriteLine(num1+op+num2+" = "+ Calculator(num1,num2,op));

        }

        static int Calculator(int num1,int num2, String op){

            // Process Inputs
            if(op == "+"){
                return num1+num2;
            }
            else if (op == "-"){
                return num1-num2;
            }
            else if (op == "*"){
                return num1*num2;
            }
            else if (op == "/"){
                return num1/num2;
            }
            else if (op == "%"){
                return num1%num2;
            }
            else{
                return 0;
            }
        }
    }
}
