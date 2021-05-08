/*
Sriram Kanagalingham, ID: 40170212
Amritpal S. Parirhar, ID: 40174714
Final Project: Faculty.h

Student.cpp used for member functions and setter and getters
*/

#include "Student.h"

Students::Students() {

	Fname = "0";
	Lname = "0";
	ID = "0";
	Dbirth = "0";
	Pgram = '0';
	Syear = 0;
	Ccredit = 0;
	gpa = 0;
}

Students::Students(string firstN, string lastN, string id, string birth, char program, int startY, int Fcredit, float scoreGPA) {

	Set_Fname(firstN);
	Set_Lname(lastN);
	Set_ID(id);
	Set_Dbirth(birth);
	Set_Pgram(program);
	Set_Syear(startY);
	Set_Ccredit(Fcredit);
	Set_gpa(scoreGPA);
}

void Students::Set_Fname(string firstN) {

	Fname = firstN;
}

void Students::Set_Lname(string lastN) {

	Lname = lastN;
}

void Students::Set_ID(string id) {

	ID = id;
}

void Students::Set_Dbirth(string birth) {

	Dbirth = birth;
}

void Students::Set_Pgram(char program) {

	Pgram = program;
}

void Students::Set_Syear(int startY) {

	Syear = startY;
}

void Students::Set_Ccredit(int Fcredit) {

	Ccredit = Fcredit;
}

void Students::Set_gpa(float scoreGPA) {

	gpa = scoreGPA;
}

bool Students::CompleteProgram() {

	switch (Get_Pgram()) {

	case 'B':
		if (Get_Ccredit() >= 140)
			return true;

		else
			return false;
		break;

	case 'M':
		if (Get_Ccredit() >= 16)
			return true;

		else
			return false;
		break;

	case 'P':
		if (Get_Ccredit() >= 12)
			return true;

		else
			return false;
		break;

	default: return false;
	}
}

string Students::StudentStatus() {

	if (Get_gpa() >= 3.5)
		return "A+";

	else if (Get_gpa() >= 3 && Get_gpa() < 3.5)
		return "A";

	else if (Get_gpa() >= 2.5 && Get_gpa() < 3)
		return "B";

	else if (Get_gpa() >= 2 && Get_gpa() < 2.5)
		return "C";

	else
		return "D";
}

void Students::Print_Std_Info() {

	cout << "First name: " << Get_Fname() << endl;
	cout << "Last name: " << Get_Lname() << endl;
	cout << "ID: " << Get_ID() << endl;
	cout << "Date of birth: " << Get_Dbirth() << endl;
	cout << "Program: " << Get_Pgram() << endl;
	cout << "Start year: " << Get_Syear() << endl;
	cout << "Completed credit: " << Get_Ccredit() << endl;
	cout << setprecision(3) << fixed << "GPA: " << Get_gpa() << endl;
}

string Students::Comapre_GPA(float scoreGPA, string id2) {

	if (Get_gpa() > scoreGPA)
		return Get_ID();

	else
		return id2;
}