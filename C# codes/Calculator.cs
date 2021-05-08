using System;

namespace Building_a_Calculator
{
    class Program
    {
        static void Main(string[] args)
        {
            // Variables
            double num1;
            double num2;

            // Functions
            Console.Write("Enter a number: ");
            num1 = Convert.ToDouble(Console.ReadLine());
            Console.Write("Enter another number: ");
            num2 = Convert.ToDouble(Console.ReadLine());

            Console.WriteLine(num1+num2);

        }
    }
}
