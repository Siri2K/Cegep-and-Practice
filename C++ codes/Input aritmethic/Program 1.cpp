// Assignment 1, Program 1
// Sriram Kanagalingham , id: 40170212
// This program determines the sum, product and average of the user input integers

#include <iostream>
using namespace std;

int main() {
	// Input variables
	int a, b, c; // Input are integers

	// Output variables
	float sum, product; // Output with no fraction
	float average; // Output may have fraction part

	// Define inputs
	cout << "Enter first number: ";
	cin >> a;
	cout << "Enter second number: ";
	cin >> b;
	cout << "Enter third number: ";
	cin >> c;

	// Calculate for output
	sum = a + b + c;
	product = a * b * c;
	average = sum / 3;

	// Print output
	cout << "Sum: " << sum << "\n";
	cout << "Product: " << product << "\n";
	cout << "Average: " << average << "\n";

}