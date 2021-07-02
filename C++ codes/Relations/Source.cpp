#include <iostream>
#include <array>
using namespace std;


int main() {
	array<int, 10>A{ 1,2,3,4,5,6,7,8,9,10 };
	int a = 0;
	int b = 0;
	int c = 0;

	for (int i = 0; i < A.size(); i++) {
		for (int j = 0; j < A.size(); j++) {
			a = A[i];
			b = A[j];
			c = a - b;

			if ((c % 2 == 0 || c % 3 == 0) && c > 0) {
				cout << "(" << a << "," << b << ") ";
				continue;
			}
		}
	}

}