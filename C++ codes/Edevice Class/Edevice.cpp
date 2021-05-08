// Sriram Kanagalingham, ID: 40170212 
// Amritpal S.Parihar, ID: 40174714
// Assignement 4, Program 2
// Takes user inputs and saves them into Edevice

#include <iostream>
#include "device.h"
using namespace std;

Edevice::Edevice() {
	category = " ";
	model_number = 0;
	color = " ";
	status = true;
	year_built = 0;
	price = 0.00;
}

Edevice::Edevice(string c, int m_num, string col, bool stat, int yrs, double p) {
	set_category(c);
	set_model_number(m_num);
	set_color(col);
	set_status(stat);
	set_year_built(yrs);
	set_price(p);
}

// Set functions
void Edevice::set_category(string c) {
	category = c;
}

void Edevice::set_model_number(int m_num) {
	model_number = m_num;
}

void Edevice::set_color(string col) {
	color = col;
}

void Edevice::set_status(bool stat) {
	status = stat;
}

void Edevice::set_year_built(int yrs) {
	year_built = yrs;
}

void Edevice::set_price(double p) {
	price = p;
}