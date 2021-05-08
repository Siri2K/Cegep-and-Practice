/*
Sriram Kanagalingham, ID: 40170212
Amritpal S. Parirhar, ID: 40174714
Final Project: Faculty.h

Header creates the student class that will 1 text file and output according to the data
*/

#include <iostream>
#include <iomanip>
#include <fstream>
using namespace std;

class Students {

private:
	string Fname, Lname, ID, Dbirth;
	char Pgram;
	int Syear, Ccredit;
	float gpa;

public:
	Students();
	Students(string, string, string, string, char, int, int, float);

	bool CompleteProgram();
	string StudentStatus();
	void Print_Std_Info();
	string Comapre_GPA(float, string);

	void Set_Fname(string);
	void Set_Lname(string);
	void Set_ID(string);
	void Set_Dbirth(string);
	void Set_Pgram(char);
	void Set_Syear(int);
	void Set_Ccredit(int);
	void Set_gpa(float);

	string Get_Fname() {

		return Fname;
	}

	string Get_Lname() {

		return Lname;
	}

	string Get_ID() {

		return ID;
	}

	string Get_Dbirth() {

		return Dbirth;
	}

	char Get_Pgram() {

		return Pgram;
	}

	int Get_Syear() {

		return Syear;
	}

	int Get_Ccredit() {

		return Ccredit;
	}

	float Get_gpa() {

		return gpa;
	}
};