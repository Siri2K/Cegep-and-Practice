using System;

namespace Building_a_Mad_Libs_Game
{
    class Program
    {
        static void Main(string[] args)
        {
            // String
            string color;
            string Plural_noun;
            string Verb;

            // Input Variable
            Console.Write("Enter a color: ");
            color = Console.ReadLine();
            Console.Write("Enter a Plural_noun: ");
            Plural_noun = Console.ReadLine();
            Console.Write("Enter a verb: ");
            Verb = Console.ReadLine();

            // Output
            Console.WriteLine("Rose are "+color);
            Console.WriteLine(Plural_noun+" are blue");
            Console.WriteLine("I " +Verb+ " You");
        }
    }
}
