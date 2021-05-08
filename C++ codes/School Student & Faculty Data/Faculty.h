/*
Sriram Kanagalingham, ID: 40170212
Amritpal S. Parirhar, ID: 40174714
Final Project: Faculty.h

Header creates the faculty class that will 3 text files and output according to the data
*/

// Include and Standard
#include<iostream>
#include <iomanip>
#include <fstream>
#include "Student.h"

using namespace std;

// Faculty Class
class Faculty {
private: // Attributes
	Students* elec_comp;
	Students* mech;
	Students* civil;

	// Arrays
	int elec_comp_size;
	int mech_size;
	int civil_size;


public: // Member functions (set and get)
	Faculty(); // Constructor

	// Memeber Functions
	void N_of_UnderGrad();
	void N_of_Grad();
	void Avg_UnderGrad();
	void Avg_Grad();
	void Highest_GPA();
};
