using System;

namespace Getting_User_Input
{
    class Program
    {
        static void Main(string[] args)
        {
            // Strings
            string name;
            string age;

            Console.Write("Enter your Name: ");
            name = Console.ReadLine();
            Console.Write("Enter your age: ");
            age = Console.ReadLine();
            Console.Write("Hello " +name+ "! I hear that you are now " +age+ " years old");
        }
    }
}
