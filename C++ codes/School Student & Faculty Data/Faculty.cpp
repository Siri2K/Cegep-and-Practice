/*
Sriram Kanagalingham, ID: 40170212
Amritpal S. Parirhar, ID: 40174714
Final Project: Faculty.h

Faculty.cpp used for member functions
*/

#include "Faculty.h"

Faculty::Faculty(){
	// Initialize Dynamic Arrays
	elec_comp = new Students[0];
	mech = new Students[0];
	civil = new Students[0];

	// Declare Student variables
	string first_name, last_name, id, date_of_birth;
	char program;
	int start_year, completed_credit, EC_num, M_num, C_num;
	float gpa;

	// Open Files
	ifstream EC_file, M_file, C_file;

	EC_file.open("student_elec_comp.txt");
	M_file.open("student_mech.txt");
	C_file.open("student_civil.txt");

	if (!(EC_file.is_open())) {
		cout << "student_elec_comp.txt could not be opened\n"; 
	}
	else if (!(M_file.is_open())) {
		cout << "student_mech.txt could not be opened\n";
	}
	else if (!(C_file.is_open())) {
		cout << "student_civil.txt could not be opened\n";
	}
	else {
		// Fill EC array
		EC_file >> EC_num;
		elec_comp = new Students[EC_num];
		for (int i = 0;i < EC_num;i++) {
			while (!EC_file.eof()) {
				EC_file >> id;
				EC_file >> start_year;
				EC_file >> completed_credit;
				EC_file >> gpa;
				EC_file >> first_name;
				EC_file >> last_name;
				EC_file >> date_of_birth;
				EC_file >> program;;
				
				elec_comp[i].Set_Fname(first_name);
				elec_comp[i].Set_Lname(last_name);
				elec_comp[i].Set_ID(id);
				elec_comp[i].Set_Dbirth(date_of_birth);
				elec_comp[i].Set_Pgram(program);
				elec_comp[i].Set_Syear(start_year);
				elec_comp[i].Set_Ccredit(completed_credit);
				elec_comp[i].Set_gpa(gpa);

				break;
			}
		}
		EC_file.close();

		// Fill M array
		M_file >> M_num;
		mech = new Students[M_num];
		for (int i = 0;i < M_num;i++) {
			while (!M_file.eof()) {
				M_file >> id;
				M_file >> start_year;
				M_file >> completed_credit;
				M_file >> gpa;
				M_file >> first_name;
				M_file >> last_name;
				M_file >> date_of_birth;
				M_file >> program;;

				mech[i].Set_Fname(first_name);
				mech[i].Set_Lname(last_name);
				mech[i].Set_ID(id);
				mech[i].Set_Dbirth(date_of_birth);
				mech[i].Set_Pgram(program);
				mech[i].Set_Syear(start_year);
				mech[i].Set_Ccredit(completed_credit);
				mech[i].Set_gpa(gpa);

				break;
			}
		}
		M_file.close();

		// Fill C array
		C_file >> C_num;
		civil = new Students[C_num];
		for (int i = 0;i < C_num;i++) {
			while (!C_file.eof()) {
				C_file >> id;
				C_file >> start_year;
				C_file >> completed_credit;
				C_file >> gpa;
				C_file >> first_name;
				C_file >> last_name;
				C_file >> date_of_birth;
				C_file >> program;;

				civil[i].Set_Fname(first_name);
				civil[i].Set_Lname(last_name);
				civil[i].Set_ID(id);
				civil[i].Set_Dbirth(date_of_birth);
				civil[i].Set_Pgram(program);
				civil[i].Set_Syear(start_year);
				civil[i].Set_Ccredit(completed_credit);
				civil[i].Set_gpa(gpa);

				break;
			}
		}
		C_file.close();
	}

	// Store variables
	elec_comp_size = EC_num;
	mech_size = M_num;
	civil_size = C_num;
}

void Faculty::N_of_UnderGrad() {
	int count = 0;

	// Count the number of Undergrad in Electrical Engineering
	for (int i = 0; i < elec_comp_size;i++) {
		if (elec_comp[i].Get_Pgram() == 'B') {
			count++;
		}
	}

	// Count the number of Undergrad in Mechanical Engineering
	for (int i = 0; i < mech_size;i++) {
		if (mech[i].Get_Pgram() == 'B') {
			count++;
		}
	}

	// Count the number of Undergrad in Civil Engineering
	for (int i = 0; i < civil_size;i++) {
		if (civil[i].Get_Pgram() == 'B') {
			count++;
		}
	}

	// Print Result
	cout << "Number of UnderGraduates = " << count << "\n";
}

void Faculty::N_of_Grad() {
	int count = 0;

	// Count the number of Undergrad in Electrical Engineering
	for (int i = 0; i < elec_comp_size;i++) {
		if (elec_comp[i].Get_Pgram() == 'M' || elec_comp[i].Get_Pgram() == 'P') {
			count++;
		}
	}

	// Count the number of Undergrad in Mechanical Engineering
	for (int i = 0; i < mech_size;i++) {
		if (mech[i].Get_Pgram() == 'M' || mech[i].Get_Pgram() == 'P') {
			count++;
		}
	}

	// Count the number of Undergrad in Mechanical Engineering
	for (int i = 0; i < civil_size;i++) {
		if (civil[i].Get_Pgram() == 'M' ||civil[i].Get_Pgram() == 'P') {
			count++;
		}
	}

	// Print Result
	cout << setprecision(3) << fixed << "Number of Graduates = " << count << "\n";
}

void Faculty::Avg_UnderGrad() {
	int count = 0;
	double sum = 0;

	// Count the number of Undergrad in Electrical Engineering
	for (int i = 0; i < elec_comp_size;i++) {
		if (elec_comp[i].Get_Pgram() == 'B') {
			count++;
			sum += elec_comp[i].Get_gpa();
		}
	}

	// Count the number of Undergrad in Mechanical Engineering
	for (int i = 0; i < mech_size;i++) {
		if (mech[i].Get_Pgram() == 'B') {
			count++;
			sum += mech[i].Get_gpa();
		}
	}

	// Count the number of Undergrad in Civil Engineering
	for (int i = 0; i < civil_size;i++) {
		if (civil[i].Get_Pgram() == 'B') {
			count++;
			sum += civil[i].Get_gpa();
		}
	}

	// Print Result
	cout << setprecision(3) << fixed << "Average of UnderGraduate students = " << (sum / count) << "\n";
}

void Faculty::Avg_Grad() {
	int count = 0;
	double sum = 0;

	// Count the number of Undergrad in Electrical Engineering
	for (int i = 0; i < elec_comp_size;i++) {
		if (elec_comp[i].Get_Pgram() == 'M' || elec_comp[i].Get_Pgram() == 'P') {
			count++;
			sum += elec_comp[i].Get_gpa();
		}
	}

	// Count the number of Undergrad in Mechanical Engineering
	for (int i = 0; i < mech_size;i++) {
		if (mech[i].Get_Pgram() == 'M' || mech[i].Get_Pgram() == 'P') {
			count++;
			sum += mech[i].Get_gpa();
		}
	}

	// Count the number of Undergrad in Civil Engineering
	for (int i = 0; i < civil_size;i++) {
		if (civil[i].Get_Pgram() == 'M' || civil[i].Get_Pgram() == 'P') {
			count++;
			sum += civil[i].Get_gpa();
		}
	}

	// Print Result
	cout << setprecision(3) << fixed << "Average of Graduate students = " << (sum / count) << "\n";
}

void Faculty::Highest_GPA() {
	float GPA_EC_max = 0;
	float GPA_M_max = 0;
	float GPA_C_max = 0;
	int pos_EC = 0;
	int pos_M = 0;
	int pos_C = 0;

	// Count the number of Undergrad in Electrical Engineering
	for (int i = 0; i < elec_comp_size;i++) {
		if (elec_comp[i].Get_gpa()>GPA_EC_max) {
			GPA_EC_max = elec_comp[i].Get_gpa();
			pos_EC = i;
		}
	}

	// Count the number of Undergrad in Electrical Engineering
	for (int i = 0; i < mech_size;i++) {
		if (mech[i].Get_gpa() > GPA_M_max) {
			GPA_M_max = mech[i].Get_gpa();
			pos_M = i;
		}
	}

	// Count the number of Undergrad in Electrical Engineering
	for (int i = 0; i < civil_size;i++) {
		if (civil[i].Get_gpa() > GPA_C_max) {
			GPA_C_max = civil[i].Get_gpa();
			pos_C = i;
		}
	}

	cout << "\nTop Ranking Student: \n";
	// Print Highest GPA information
	if (GPA_EC_max >= GPA_M_max && GPA_EC_max >= GPA_C_max) {
		elec_comp[pos_EC].Print_Std_Info();

	}
	else if (GPA_M_max >= GPA_EC_max && GPA_EC_max >= GPA_C_max) {
		mech[pos_M].Print_Std_Info();
	}
	else if (GPA_C_max >= GPA_M_max && GPA_C_max >= GPA_EC_max) {
		civil[pos_C].Print_Std_Info();
	}
}