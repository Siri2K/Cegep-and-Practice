// Sriram Kanagalingham , id:40170212
// Assignment 2, Program 3
// This program will build a house

#include<iostream>
#include<iomanip>
using namespace std;

int main() {
	// Define Integer Variables
	int width, height; // Height and width of the house
	int roof_h, roof_w; // Height and width of the roof
	int Try_Count; // # of attempts for house program
	int House_Count; // Number of Houses Built
	int i, j; // Disposable values for roof columns and row

	// Define String variables
	string user_name; // Name of User
	string Draw_House; // Yes or No to Draw House

	// Input String Commands
	cout << "What is your name? "; // Ask for name
	cin >> user_name;

	cout << "Well " << user_name << "  welcome to the house drawing program.\n";
	cout << "Do you want me to draw a simple house for you? (yes/no) ";
	cin >> Draw_House;

	// Initialize House Count
	House_Count = 0;

	while (Draw_House == "yes") {
		// Initialize Already known variables
		Try_Count = 1;
		width = 0;
		House_Count++;

		// Input Roof height
		cout << "\n\nEnter height of the house you want me to draw: ";
		cin >> height;

		// Input width and check if width is divisible by 2
		while (Try_Count <= 3) {
			cout << "Please enter an even number for the width of the house (must be even numbers and bigger than 2): ";
			cin >> width;

			if (width > 2 && width % 2 == 0) {
				break; // Breaks the loop if an acceptable width is entered
			}
			cout << "You enter " << width << " for the width. Not an even number!\n";;
			Try_Count++;
		}

		if (Try_Count > 3) {
			cout << "\n\nit seems you are having troubles entering even numbers! Program ends now."; // End screen after too many tries
			break;
		}
		else {
			roof_h = width / 2;
			roof_w = width + 2;

			// Draw Roof
			for (i = 1; i <= roof_h; i++) { // Determine number of rows to make roof
				cout << "  "; // Initial Space
				for (j = 1; j <= 2 * roof_h; j++) { // Determine number of colums to make roof
					if (j >= roof_h - (i - 1) && j <= roof_h + i) {
						cout << "*"; // Print Star
					}
					else {
						cout << " "; // Print Space
					}
				}
				cout << "\n";
			}

			// Draw Walls
			for (i = 1; i <= height; i++) {
				cout << " ";
				cout << "|" << setw((roof_w)) << "|\n";
			}

			// Draw Floor
			cout << "  ";
			for (i = 1; i <= width; i++) {
				cout << "-";
			}
		}
		// Loop back
		cout <<"\n\nDo you want me to draw a simple house for you? (yes/no) ";
		cin >> Draw_House;
	}
	// Finishing Sentence
	if (House_Count>=1 && (width > 2 && width % 2 == 0)) {
		cout << "Hope you like your " << House_Count << " houses!";
	}
}