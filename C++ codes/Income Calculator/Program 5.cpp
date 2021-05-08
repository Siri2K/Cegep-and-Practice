// Assignment 1, Program 5
// Sriram Kanagalingham, student id: 40170212
// This program calculates net income after income tax

#include <iostream>
using namespace std;

int main() {
	// Declare variable
	double income, income_tax, net_income;

	// Define input variable
	cout << "Enter income: ";
	cin >> income;
	cout << "\n";

	// Decide income tax and net income
	if (income<=48535) {
		income_tax = income * 0.15;
		net_income = income - income_tax;
	}
	else if (income > 48535 && income <= 97069) {
		income_tax = 48535 * 0.15 + (income - 48535) * 0.205; 
		net_income = income - income_tax;
	}
	else if (income > 97069 && income <= 150473) {
		income_tax = 48535 * 0.15 + 48534 * 0.205 + (income - 97069) * 0.26; 
		net_income = income - income_tax;
	}
	else if (income > 150473 && income <= 214368) {
		income_tax = 48535 * 0.15 + 48534 * 0.205 + 53404 * 0.26 + (income - 150473) * 0.29;
		net_income = income - income_tax;
	}
	else if (income > 214368) {
		income_tax = 48535 * 0.15 + 48534 * 0.205 + 53404 * 0.26 + 63895 * 0.29 + (income - 214368) * 0.33;
		net_income = income - income_tax;
	}

	// Display Output
	cout << "Your income is " << income << "$\n";
	cout << "Your income tax is " << income_tax << "$\n";
	cout << "Your net income is " << net_income << "$\n";
}