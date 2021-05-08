/*
Sriram Kanagalingham, ID: 40170212
Amritpal S. Parirhar, ID: 40174714
Final Project: Faculty.h

Driver (main) program used to test Student and Faculty Functions
*/

#include "Faculty.h"

int main() {
 
    // Test Student Program
    string first_name, last_name, id, date_of_birth;
    char program;
    int start_year, completed_credit, num_s;
    float gpa;

    ifstream students_file;
    students_file.open("students.txt");

    if (!students_file) cout << "File could not be opened" << endl;
    else students_file >> num_s;

    Students* engineer;
    engineer = new Students[num_s];

    for (int i = 0; i < num_s; i++) {
        while (!students_file.eof()) {

            students_file >> id;
            students_file >> start_year;
            students_file >> completed_credit;
            students_file >> gpa;
            students_file >> first_name;
            students_file >> last_name;
            students_file >> date_of_birth;
            students_file >> program;

            engineer[i].Set_Fname(first_name);
            engineer[i].Set_Lname(last_name);
            engineer[i].Set_ID(id);
            engineer[i].Set_Dbirth(date_of_birth);
            engineer[i].Set_Pgram(program);
            engineer[i].Set_Syear(start_year);
            engineer[i].Set_Ccredit(completed_credit);
            engineer[i].Set_gpa(gpa);

            break;
        }
    }
    students_file.close();

    // Check Student in line 3 and 4 oftext file
    cout << "Did Student #3 complete Program? " << (engineer[2].CompleteProgram() ? "Pass" : "Fail") << "\n";
    cout << "Student #3 Grade:? " << engineer[2].StudentStatus() << "\n";
    
    cout << "\nPrint Student #3 data: \n";
    engineer[2].Print_Std_Info();

    cout << "\n";
    cout << "Compare Gpa of Student 3 and 4: "<< engineer[2].Comapre_GPA(engineer[3].Get_gpa(), engineer[3].Get_ID());


    // Seperate faculty and Students
    cout << "\n------------------------------------------\n";

    //Test Faculty 
    Faculty School;

    School.N_of_UnderGrad();
    School.N_of_Grad();
    School.Avg_UnderGrad();
    School.Avg_Grad();
    School.Highest_GPA();
}