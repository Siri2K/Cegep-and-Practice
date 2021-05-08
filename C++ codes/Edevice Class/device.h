// Sriram Kanagalingham, ID: 40170212 
// Amritpal S.Parihar, ID: 40174714
// Header sets up the class Edevice and it's attributes

#include <iostream>
using namespace std;

class Edevice {
	private:
		// Attributes
		string category, color;
		int model_number, year_built;
		bool status;
		double price;

	public:
		// Constructor
		Edevice();
		Edevice(string, int, string, bool, int, double);

		// Set functions
		void set_category(string);
		void set_model_number(int);
		void set_color(string);
		void set_status(bool);
		void set_year_built(int);
		void set_price(double);

		// Get functions
		const string get_category() {
			return category;
		}

		const int get_model_number() {
			return model_number;
		}

		const string get_color() {
			return color;
		}

		const bool get_status() {
			return status;
		}

		const int get_year_built() {
			return year_built;
		}

		const double get_price() {
			return price;
		}
};