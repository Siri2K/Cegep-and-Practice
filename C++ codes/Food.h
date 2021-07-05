#ifndef Food_H
#define Food_H

// Headers and Namespace
#include <windows.h>
#include <cstdlib>

class Food
{
private:
	COORD pos;

public:
	// Member Function
	void gen_food();
	COORD get_pos();
};
#endif // !Food_H