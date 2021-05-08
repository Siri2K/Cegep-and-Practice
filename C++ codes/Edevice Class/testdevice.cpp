// Sriram Kanagalingham, ID: 40170212 
// Tests the Edevice and device.h to see classes work

#include <iostream>
#include "device.h"
using namespace std;

int main() {
	// Class Attribute variables
	string category, color;
	int model_number, year_built;
	bool status;
	double price;

	// Dummy variable
	string condition;

	for (int i = 1;i < 3;i++) {
		cout << "Product #" << i << "\n"; // Product number

		// Input Variables 
		do
		{
			cout << "Enter Category [Laptop,Tablet,Smartphone,Smartwatch]: ";
			cin >> category;
		} while (category != "Laptop" && category != "Tablet" && category != "Smartphone" && category != "Smartwatch");

		do
		{
			cout << "Enter Model Number: ";
			cin >> model_number;
		} while (model_number<=0);
		

		cout << "Enter Color: ";
		cin >> color;

		do
		{
			cout << "Enter Status [new or used]: ";
			cin >> condition;

			if (condition == "new") {
				status = true;
			}
			else if (condition == "used") {
				status = false;
			}

		} while (condition!="new" && condition != "used");

		do
		{
			cout << "Enter Year Built: ";
			cin >> year_built;
		} while (year_built <= 0);

		do
		{
			cout << "Enter Price: ";
			cin >> price;
		} while (price <= 0);

		// Call class
		if (i==1) {
			Edevice device1(category, model_number, color, status, year_built, price);

			// Test member functions
			cout << "\n"; // Seperate input from test

			cout << "Category: " << device1.get_category() << "\n";
			cout << "Model #: " << device1.get_model_number() << "\n";
			cout << "Color: " << device1.get_color() << "\n";
			cout << "Status: " << (device1.get_status() ? "new" : "used") << "\n";
			cout << "Year Built: " << device1.get_year_built() << "\n";
			cout << "Price: " << device1.get_price() << "\n\n";
		}
		else if (i==2) {
			Edevice device2(category, model_number, color, status, year_built, price);

			// Test member functions
			cout << "\n"; // Seperate input from test

			cout << "Category: " << device2.get_category() << "\n";
			cout << "Model #: " << device2.get_model_number() << "\n";
			cout << "Color: " << device2.get_color() << "\n";
			cout << "Status: " << (device2.get_status() ? "new" : "used") << "\n";
			cout << "Year Built: " << device2.get_year_built() << "\n";
			cout << "Price: " << device2.get_price() << "\n\n";
		}
	}
	return 0;
}