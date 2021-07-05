#ifndef Snake_H
#define Snake_H

// Headers and Namespace
#include <windows.h>
#include <vector>
using namespace std;


class Snake {
private:
	COORD pos;
	int length;
	int velocity;
	char direction;
	vector<COORD>body;

public:
	// Constructor
	Snake(COORD pos, int vel);

	// Member Funcions
	void change_direction(char dir);
	void move_snake();
	COORD get_pos();
	vector<COORD> get_body();
	bool food_eaten(COORD food_pos);
	void grow();
	bool Collision();
};
#endif // !Snake_H