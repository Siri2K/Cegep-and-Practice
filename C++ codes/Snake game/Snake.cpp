#include "Snake.h"

// defined Variables
#define height 25
#define width 50

Snake::Snake(COORD pos,int vel) {
	// Initialize variables
	this->pos = pos;
	this->velocity = vel;
	length = 1;
	direction = 'n';

	body.push_back(pos);
}

void Snake::change_direction(char dir) {
	direction = dir;
}

void Snake::move_snake() {
	switch (direction)
	{
	case 'u':
		pos.Y -= velocity;
		break;

	case 'd':
		pos.Y += velocity;
		break;

	case 'r':
		pos.X += velocity;
		break;

	case 'l':
		pos.X -= velocity;
		break;

	default:
		break;
	}

	body.push_back(pos);

	if (body.size()>length) {
		body.erase(body.begin());
	}
}

COORD Snake:: get_pos() {
	return pos;
}

vector<COORD> Snake::get_body() {
	return body;
}

bool Snake::food_eaten(COORD food_pos) {
	if (food_pos.X == pos.X && food_pos.Y == pos.Y) {
		return true;
	}
	else {
		return false;
	}
}

void Snake::grow() {
	length++;
}

bool Snake::Collision() {
	if (pos.X<1 || pos.X > width - 2 || pos.Y < 1 || pos.Y > height - 2) {
		return true;

		for (int i = 0; i < length - 1; i++) {
			if (pos.X == body[i].X && pos.Y == body[i].Y) {
				return true;
			}
		}
	}
	else {
		return false;
	}
		
}