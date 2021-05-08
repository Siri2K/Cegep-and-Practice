using System;

namespace Variables
{
    class Program
    {
    
        static void Main(string[] args)
        {
           // String Variables
            string characterName;

            // Interger Variables
            int characterAge;

            // Commands and variable values
            characterName = "Tommy";
            characterAge = 70;

            Console.WriteLine("There once was a man named " + characterName);
            Console.WriteLine("he was " +characterAge+ " years old");

            characterName = "George";
            Console.WriteLine("He really liked the name " + characterName);
            Console.WriteLine("but he didn't like being  " + characterAge );
            Console.WriteLine("");
        }
    }
}
