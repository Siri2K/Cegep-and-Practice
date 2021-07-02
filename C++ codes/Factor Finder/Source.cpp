// Sriram Kanagalingham
// Program to find factors and find middle ground

#include <iostream>
using namespace std;

// Definine function prototypes
void factor(int num, char round);
void middle(int num, int question_to_do);

int main() {
	// Define variables
	int number_of_questions;
	char sign;

	// Input variables
	cout << "How many questions in hw? ";
	cin >> number_of_questions >> sign;

	// Call functions
	factor(number_of_questions, sign);
}

// Component function 
void factor(int num, char round) {
	int i; // Disposable variable
	int factorial, question_to_do;

	if (num % 2 == 1 && round == '+') {
		num += 1;
	}
	else if (num % 2 == 1 && round == '-') {
		num -= 1;
	}

	cout << "# of questions to be done: ";

	for (i = 1;i <= num;i++) {
		factorial = num % i;

		if (num % i == 0) {
			cout << i << " ";
			continue;
		}
	}

	// Input how many question I want to do
	cout << "\nHow many questions to do? ";
	cin >> question_to_do;

	// Call functions
	middle(num, question_to_do);
}

void middle(int num, int question_to_be_done) {
	// How many inverals between questions
	int interval;

	interval = num / question_to_be_done;

	cout << "skip # of questions to be done: " << interval;

}