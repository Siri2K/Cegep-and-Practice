// Assignement 2, Program 4
// Sriram Kanagalingham, id:40170212
/*
This program will take 2 numbers (lower and upper bound) and perform 3 function depending on which is chosen
*/

#include <iostream>
#include <iomanip>
using namespace std;

// Define Function prototypes
void function1(int lower, int higher);
void function2(int lower, int higher);
void function3(int lower, int higher);

int main() {
	// Define Main Integer variables
	int num1, num2; // Input numbers
	int lower_bound, upper_bound; // Variables to check which is higher or lower

	// Define character Variable
	char character; // Variable to decide which function will be done

	// Input numbers and check which are lower_bound and upper_bound 
	cout << "Please enter two positive integer numbers: (Lower Bound/Upper Bound): ";
	cin >> num1 >> num2; // Input 2 numbers 
	cout << "\n\n";

	if (num1 >= num2) {
		upper_bound = num1;
		lower_bound = num2;
	}
	else {
		upper_bound = num2;
		lower_bound = num1;
	}

	// Select which should be performed
	cout << "Please enter a character: ";
	cin >> character;
	cout << "\n\n";

	// Function performed
	switch (character) {
	case 'a': // Function 1 is called 
		function1(lower_bound, upper_bound);
		break;
	
	case 'b': // Function 2 is called 
		function2(lower_bound, upper_bound);
		break;

	case'c': // Function 3 is called 
		function3(lower_bound, upper_bound);
		break;
	default:
		cout << "Invalid Input";
	}
}

// Functions called by the main function
void function1(int lower, int higher) { // list out numbers that are multiples of 2 and 14 between intervals
	int number; // Displayed Variable exclusive to this function 

	// Loop to list out numbers that are multiples of 2 and 14 between
	cout << "List of numbers in this interval which are multiple of both 2 and 7: ";
	for (number = lower; number <= higher; number++) {
		if (number % 2 == 0 && number % 7 == 0) {
			cout << number << " ";
		}
	}
	cout << "\n\n";
}

void function2(int lower, int higher) { // finds the difference between min and max
	int  result; // Displayed Variable exclusive to this function

		// Function 2 is called and displays the difference between the intervals 
	result = higher - lower;
	cout << "The difference between the two numbers is " << result << "\n\n";
}

void function3(int lower, int higher) { // Finds the sum of 1/n with n = numbers between min and max
	double frac; // Temporary value 
	double sum; // Displayed variable unique to function

	// Initialize the display variable
	sum = 0;

	// Loop to determine sum
	for (frac = lower; frac <= higher; frac++) {
		sum += 1 / frac;
	}

	// Display Values
	cout << "The value of the sum is: " << fixed << setprecision(3) << sum << "\n\n";
}