// Assignement 2 Program 1
// Sriram Kanagalingham , id:40170212
/* This Program converts Celsius to Farenheight and Kelvin.
All 3 units are shown in a table 1 to 50 degrees*/

#include <iostream>
#include <iomanip> // Header that manipulates output precision
using namespace std;

int main() {
	// Define Variables
	int Celsius;
	double Farenheight, Kelvin;

	//Initialize variable
	Celsius = 1;
	cout << setw(5) << "Celsius" << setw(15) << "Farenheight" << setw(10) << "Kelvin" << "\n";

	// Perform Loop
	do {
		// Calculate for conversion
		Farenheight = 1.8 * Celsius + 32;
		Kelvin = Celsius + 273.15;

		// Display result
		cout << setw(0) << Celsius;

		if (Celsius < 10) { // Set Table position precision 
			cout << setw(14) << fixed << setprecision(1) << Farenheight;
			cout << setw(17) << fixed << setprecision(2) << Kelvin << "\n";
		}
		else if (Celsius >= 10 && Farenheight < 100) {
			cout << setw(13) << fixed << setprecision(1) << Farenheight;
			cout << setw(17) << fixed << setprecision(2) << Kelvin << "\n";
		}
		else if (Celsius >= 10 && Farenheight >= 100) {
			cout << setw(14) << fixed << setprecision(1) << Farenheight;
			cout << setw(16) << fixed << setprecision(2) << Kelvin << "\n";
		}

	} while (++Celsius <= 50);
}