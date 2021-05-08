// Assignment 1, Program 4
// Sriram Kanagalingham, Student id: 40170212
// This program converts number grades to letter grades

#include <iostream>
using namespace std;

int main() {
	//Declare variable
	int grade;

	// Define Variable
	cout << "Enter final grade: ";
	cin >> grade; 

	// Decide output
	if (grade >= 90) {
		cout << "A+";
	}
	else if (grade >= 85 && grade < 90) {
		cout << "A";
	}
	else if (grade >= 80 && grade < 85) {
		cout << "A-";
	}
	else if (grade >= 75 && grade < 80) {
		cout << "B+";
	}
	else if (grade >= 70 && grade < 75) {
		cout << "B";
	}
	else if (grade >= 65 && grade < 70) {
		cout << "C+";
	}
	else if (grade >= 60 && grade < 65) {
		cout << "C";
	}
	else if (grade >= 55 && grade < 60) {
		cout << "C-";
	}
	else if (grade >= 50 && grade < 55) {
		cout << "D+";
	}
	else if (grade >= 45 && grade < 50) {
		cout << "D";
	}
	else if (grade >= 40 && grade < 45) {
		cout << "D-";
	}
	else if (grade >= 0 && grade < 40) {
		cout << "F";
	}
	else {
		cout << "Invalid Grade";
	}
}