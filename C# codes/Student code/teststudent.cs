using System;

namespace C__codes
{
  class Program {
      static void Main(string[] args){
          Student student1 = new Student();
          Student student2 = new Student ("Sriram","Kanagalingham","1749494","29/09/1999",'B',2020,15,3);

          Console.WriteLine(student1.get_Fname());
          Console.WriteLine(student2.get_Fname());
      }  
  }
}