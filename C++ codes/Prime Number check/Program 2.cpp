// Assignement 2, Program 2
// Sriram Kanagalingham, id: 40170212
// This program will tell the user if a number is prime or not

#include <iostream>
using namespace std;


int main() {
	// Define variables
	int number, remainder; // Input number and Output condition
	int x; // Disposable variable

	// Initialize variables
	cout << "Enter a number: ";
	cin >> number;
	remainder = 0;

	// Determine if prime or not
	if (number < 2) {
		cout<<"Not a prime number";
	}
	for (x = 2; x < number;x++) {
		remainder = number % x; // Divisable number have no remaiinders

		if (remainder == 0) {
			cout << "Not a prime number";
			break;
		}
	}
	if (x == number && remainder != 0) {
		cout << "Prime number";
	}
	cout << "\n\n";
}
