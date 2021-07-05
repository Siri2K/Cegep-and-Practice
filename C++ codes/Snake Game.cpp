/*
Sriram Kanagalingham
Snake-Game
*/

// Header and Namespace
#include <iostream>
#include <conio.h>
#include <ctime>

#include "Snake.h"
#include "Food.h"
using namespace std;


// defined Variables
#define height 25
#define width 50

// Global Variable
Snake snake({ width / 2,height / 2 }, 1);
Food food;
int score;

// Function Prototypes
void board();

// Main Function
int main()
{
    // Initialize variable
    score = 0;
    bool game_over = false;

    // Process Variables
    srand(time(NULL));
    food.gen_food();

    while (!game_over) {
        board();

        if (_kbhit()) {
            switch (_getch())
            {
            case 'w':
                snake.change_direction('u');
                break;

            case 's':
                snake.change_direction('d');
                break;

            case 'd':
                snake.change_direction('r');
                break;

            case 'a':
                snake.change_direction('l');
                break;

            default:
                break;
            }
        }

        if (snake.food_eaten(food.get_pos())) {
            food.gen_food();
            snake.grow();
            score += 10;
        }

        if (snake.Collision()) {
            game_over = true;
        }

        snake.move_snake();
        SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), {0,0}); // Clear Terminal Screen 
    }

    return 0;
}

// Other Functions
void board() {
    // Initialize variables
    COORD snake_position = snake.get_pos();
    COORD food_position = food.get_pos(); 
    
    // Initialize vector
    vector<COORD> snake_body = snake.get_body();

    // Process Inputs
    cout << "SCORE : " << score << "\n\n";

    for (int i = 0; i < height; i++) {
        cout << "\t\t#";

        for (int j = 0; j < width-2; j++) {
            if (i == 0 || i == height - 1) {
                cout << "#";
            }
            else if (i == snake_position.Y && j+1 == snake_position.X) {
                cout << "0";
            }
            else if (i == food_position.Y && j+1 == food_position.X) {
                cout << "@";
            }
            else {
                bool isBodyPart = false;
                for (int k = 0; k < snake_body.size()-1;k++) {
                    if (i==snake_body[k].Y && j+1 == snake_body[k].X) {
                        cout << 'o';
                        isBodyPart = true;
                        break;
                    }
                }
                if (!isBodyPart) {
                    cout << " ";
                }
            }
        }

        cout << "#\n";
    }
}
