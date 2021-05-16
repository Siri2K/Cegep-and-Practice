using System;

namespace C__codes
{
  class Student {
       // private variables
       private String Fname,Lname,ID,Dbirth;
       private char Pgram;
       int Syear,Ccredit;
       float gpa;

       // Constructors
       public Student(){
           Fname = "-";
           Lname = "-";
           ID = "-";
           Dbirth = "-";
           Pgram = '-';
           Syear = 0;
           Ccredit = 0;
           gpa = 0;
       }
       public Student(String firstName,String lastName,String id,String dbirth,char program,int startYear,int Credit,float GPA){
           set_Fname(firstName);
           set_Lname(lastName);
           set_ID(id);
           set_Dbirth(dbirth);
           set_Pgram(program);
           set_Syear(startYear);
           set_Ccredit(Credit);
           set_gpa(GPA);
       }

       // Set functions
       public void set_Fname(String firstName){
           Fname = firstName;
       }
       public void set_Lname(String lastName){
           Lname = lastName;
       }
       public void set_ID(String id){
           ID = id;
       }
       public void set_Dbirth(String dbirth){
           Dbirth = dbirth;
       }
       public void set_Pgram(char program){
           Pgram = program;
       }
       public void set_Syear(int startYear){
           Syear = startYear;
       }
       public void set_Ccredit(int Credit){
           Ccredit = Credit;
       }
       public void set_gpa(float GPA){
           gpa = GPA;
       }
        
       public String get_Fname(){
           return Fname;
       }
       public String get_Lname(){
           return Lname;
       }
       public String get_ID(){
           return ID;
       }
       public String get_Dbirth(){
           return Dbirth;
       }
       public char get_Pgram(){
           return Pgram;
       }
       public int get_Syear(){
           return Syear;
       }
       public int get_Ccredit(){
           return Ccredit;
       }
       public float get_gpa(){
           return gpa;
       }
  }
}