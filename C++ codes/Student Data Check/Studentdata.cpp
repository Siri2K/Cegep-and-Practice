// Headers 
#include <iostream>

// Function Prototypes
std::string letter_grade(int);

// Main loop
int main(){
    // Declare Variables
    std::string student_name;
    std::string student_ID;
    int student_grade;

    // Input variables
    std::cout<<"Enter student name : ";
    std::cin>> student_name;

    std::cout<<"Enter student ID : ";
    std::cin>> student_ID;

    std::cout<<"Enter student grade (0-100) : ";
    std::cin>> student_grade;
    
    // Print Output
    std::cout<<"--------------------\n";
    std::cout<<"Student Profile:\n\n";
    std::cout<<"Student Name: "<<student_name <<"\n";
    std::cout<<"Student ID: "<<student_ID <<"\n";
    std::cout<<"Student Grade: "<<letter_grade(student_grade)<<"\n";

    return 0;
}

// Determine letter grade from input
std::string letter_grade(int grade){
 if(grade>=0 && grade<50){
     return "F";
 }
 else if(grade>=50&&grade<60){
     return "D";
 }
 else if(grade>=60&&grade<70){
     return "C";
 }
 else if(grade>=70&&grade<80){
     return "B";
 }
 else if(grade>=80&&grade<90){
     return "A";
 }
 else if(grade>=90&&grade<100){
     return "A+";
 }
 else{
     return "Invalid Grade";
 }
}
