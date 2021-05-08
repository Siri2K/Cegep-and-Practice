// Sriram Kanagalingham ID:40170212
// Assignement 4, Program 1
// Outputs the product of each row in a 5x6 array with user inputs for elements

// Headers and Preprocessors
#include <iostream>
#include <iomanip>
#include <array>
using namespace std;

// Global variables
const size_t row = 5;
const size_t column = 6;

// Function Prototype
void row_product(array<array<int, column>, row>& r); // Prints end result

// Main Loop
int main() {
	array<array<int, column>, row> element{};

	cout << "A = \n";
	for (int i = 0;i <= row - 1;i++) { // Fill out arrays row by row
		cin >> element[i][0]
			>> element[i][1]
			>> element[i][2]
			>> element[i][3]
			>> element[i][4]
		    >> element[i][5];
	}
	cout << "\n";
	row_product(element);

	return 0; // main = 0
}

void row_product(array<array<int, column>, row>& r) {
	array<int, column>sum{ 1,1,1,1,1,1 }; // Output variable

	for (int i = 0;i <= row - 1;i++) {
		for (int j = 0;j <= column - 1;j++) {
			sum[i] *= r[i][j];
		}
		cout << sum[i] << " ";
	}
}