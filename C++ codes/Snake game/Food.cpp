#include "Food.h"

// defined Variables
#define height 25
#define width 50

void Food::gen_food() {
	pos.X = rand() % (width-3) + 1;
	pos.Y = rand() % (height-3) + 1;
}

COORD Food::get_pos() {
	return pos;
}