// Assignment 1, Program 3
// Sriram Kanagalingham, id:40170212
// This program prints the number from smallest to largest
#include <iostream>
using namespace std;

int main() {
	// Input Variables
	int num1, num2, num3;

	// Output variables
	int lowest_val = 0;
	int highest_val = 0;
	int middle = 0;

	// Define Variables
	cout << "Enter first number: ";
	cin >> num1;

	cout << "Enter second number: ";
	cin >> num2;

	cout << "Enter third number: ";
	cin >> num3;

	// Determine the output
	if (num1 == num2 || num1 == num3 || num2 == num3) {
		cout << "There are too many numbers that are the same";
	}
	else {
		// Check if first number is the maximum or minimum
		if (num1 > num2 && num1 > num3) {
			highest_val = num1;
		}
		else if (num1 < num2 && num1 < num3) {
			lowest_val = num1;
		}
		else {
			middle = num1;
		}

		// Check if second number is the maximum or minimum
		if (num2 > num1 && num2 > num3) {
			highest_val = num2;
		}
		else if (num2 < num1 && num2 < num3) {
			lowest_val = num2;
		}
		else {
			middle = num2;
		}

		// Check if third number is the maximum or minimum
		if (num3 > num1 && num3 > num2) {
			highest_val = num3;
		}
		else if (num3 < num1 && num3 < num2) {
			lowest_val = num3;
		}
		else {
			middle = num3;
		}
	}

	// Display output
	cout << lowest_val << ", "; // Lowest value
	cout << middle << ", ";
	cout << highest_val; // Highest value
}