//Assignment 3, Week 7
//Number Reverser
//Sriram Kanagalingham - 40170212 & Amritpal S. Parihar - 40174714

#include<iostream>
#include<cmath> //Math functions
using namespace std;

void reverse(int); //Function to reverse the order

int main(){
	
	int num1, num2; //Declare Integer variables

	//Initialize and process integers 
	cout << "Type an integer number: ";
	cin >> num1; //Input first number
	reverse(num1); //Reverse first number

	cout << "Type an integer number: ";
	cin >> num2; //Input first number
	reverse(num2); //Reverse first number
}

void reverse(int num){ //Specific Function

	//Declare integers
	int reverse_num; //Output
	int num_t, digit_count; //Local integers

	//Initialize integers
	num_t = num;
	reverse_num = 0;
	digit_count = 0;

	while(num_t / 10 != 0){ //Count the number of digits
		
		num_t /= 10;
		digit_count++;
	}

	if(num == 0){ //Rearrange digits
	
		reverse_num = num;
		cout << "Output: " << reverse_num;
	}
	
	else{
		
		for(int i = 0; i <= digit_count; i++){
			
			reverse_num += (num % 10) * pow(10, digit_count - i);
			num /= 10;
		}
		
		cout << "Output: " << reverse_num << "\n\n";
	}
}

