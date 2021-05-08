//Assignment 3, Week 7
//Horizontal Robot Mover
Sriram Kanagalingham - 40170212

#include <iostream>
#include <array>
#include <iomanip> 
using namespace std;

void Right(int &, int &);
void Left(int &, int &);
void Reboot();
void Display();
void ShowRobot();
void Cancel(int, int &);
void Replay(int);
void Exit(int &);

const size_t POS{10};
array<char, POS> robot{'^', '-', '-', '-', '-', '-', '-', '-', '-', '-'};

int RightoF = 0, LeftoF = 0, RightoCF = 0, LeftoCF = 0;

int main(){
    
    int ExitFlag = 0, RLMovement, SavedMov, SavedMovC;
    char cmd;
    
    cout << "Robot is ready for some action!" << endl;
    cout << "Robot's position is displayed as ^" << endl;
    cout << "To get started, enter a character corresponding to the available commands below:" << endl;
    cout << "--------------------------------------------------------------------------------" << endl;
    cout << setw(30) << "r | Right" << endl;
    cout << setw(29) << "l | Left" << endl;
    cout << setw(32) << "d | Display" << endl;
    cout << setw(31) << "t | Reboot" << endl;
    cout << setw(35) << "a | Show Array" << endl;
    cout << setw(31) << "c | Cancel" << endl;
    cout << setw(31) << "p | Replay" << endl;
    cout << setw(29) << "e | Exit" << endl;
    cout << "--------------------------------------------------------------------------------" << endl;
    
    while(ExitFlag == 0){
        
        cout << "Enter a character corresponding to the available commands above: ";
        cin >> cmd;
        
        switch(cmd){
            
            case 'r':
                Right(RLMovement, SavedMov);
                break;
            
            case 'l': 
                Left(RLMovement, SavedMov);
                break;
                
            case 'd':
                Display();
                break;
                
            case 't':
                Reboot();
                break;
                
            case 'a':
                ShowRobot();
                break;
                
            case 'c':
                Cancel(SavedMov, SavedMovC);
                break;
                
            case 'p':
                Replay(SavedMovC);
                break;
                
            case 'e':
                Exit(ExitFlag);
                break;
                
            default: cout << "ERROR - Invalid command\n" << endl;
        }
    }

    return 0;
}

void Right(int &RposO, int &RSavedO){
    
    int Cpos = 0, i = 0;
    
    cout << "Enter a number to move robot --> by: ";
    cin >> RposO;
    
    while(i < robot.size() && robot[i] == '-')
        Cpos = ++i;
        
    if(RposO <= 0 || RposO > 9)
       cout << "ERROR - Robot will go out of bound/Robot will not move\n" << endl;
       
    else{
    
        if((Cpos + RposO) > 9)
            cout << "ERROR - Robot will go out of bound\n" << endl;
        
        else{
            
            robot[Cpos] = '-';
            robot[Cpos + RposO] = '^';
			
            RSavedO = RposO;
            
            RightoF = 1;
            LeftoF = 0;
            
            cout << "Robot has moved --> by " << RposO << "\n" << endl;
        }
    }
}

void Left(int &LposO, int &LSavedO){
    
    int Cpos = 0, i = 0;
    
    cout << "Enter a number to move robot <-- by: ";
    cin >> LposO;
    
    while(i < robot.size() && robot[i] == '-')
        Cpos = ++i; 
        
    if(LposO <= 0 || LposO > 9)
        cout << "ERROR - Robot will go out of bound/Robot will not move\n" << endl; 
    
    else{

        if((Cpos - LposO) < 0)
            cout << "ERROR - Robot will go out of bound\n" << endl;
        
        else{
            
            robot[Cpos] = '-';
            robot[Cpos - LposO] = '^';
			
            LSavedO = LposO;
            
            RightoF = 0;
            LeftoF = 1;
            
            cout << "Robot has moved <-- by " << LposO << "\n" << endl;
        }
    }
}

void Reboot(){
    
    int Cpos = 0, i = 0;
    
    while(i < robot.size() && robot[i] == '-')
        Cpos = ++i; 
    
    robot[Cpos] = '-';
    robot[0] = '^';
    
    RightoF = 0;
    LeftoF = 0;
    RightoCF = 0;
    LeftoCF = 0;
    
    cout << "Robot has been rebooted. This cannot be cancelled/replayed\n" << endl;
}

void Display(){
    
    int Cpos = 0, i = 0;
    
    while(i < robot.size() && robot[i] == '-')
        Cpos = ++i;
    
    cout << "Robot is at position " << Cpos << " \n" << endl;
}

void ShowRobot(){
    
    for(size_t i{0}; i < robot.size(); ++i)
         cout << robot[i];
    
    cout << " \n" << endl;
}

void Exit(int &leave){
    
    leave = 1;
    
    cout << "Robot is shutting down..." << endl;
}

void Cancel(int latestMov, int &latestMovC){
    
    int Cpos = 0, i = 0;

    while(i < robot.size() && robot[i] == '-')
        Cpos = ++i;
        
    if(LeftoF == 0 && RightoF == 1){
        
        if((Cpos - latestMov) < 0)
             cout << "ERROR - Robot will go out of bound\n" << endl;
             
        else{

            robot[Cpos] = '-';
            robot[Cpos - latestMov] = '^';
            
            latestMovC = latestMov;
            
            RightoF = 0;
            RightoCF = 1;
            
            cout << "Latest movement is --> by " << latestMov << ", it's now cancelled\n" << endl;
        }
    }
    
    else if(RightoF == 0 && LeftoF == 1){
        
        if((Cpos + latestMov) > 9)
            cout << "ERROR - Robot will go out of bound\n" << endl;
            
        else{
        
            robot[Cpos] = '-';
            robot[Cpos + latestMov] = '^';
            
            latestMovC = latestMov;
            
            LeftoF = 0;
            LeftoCF = 1;
            
            cout << "Latest movement is <-- by " << latestMov << ", it's now cancelled\n" << endl;
        }
    }
    
    else
        cout << "Robot has not moved at all!/Latest movement already cancelled/Reboot cannot cancel\n" << endl;
}

void Replay(int latestMovC){ 
    
    int Cpos = 0, i = 0;

    while(i < robot.size() && robot[i] == '-')
        Cpos = ++i;
        
    if(RightoCF == 1 && LeftoCF == 0){
        
        if((Cpos + latestMovC) > 9)
            cout << "ERROR - Robot will go out of bound\n" << endl;
        
        else{
            
            robot[Cpos] = '-';
            robot[Cpos + latestMovC] = '^';
            
            RightoF = 0;
            LeftoF = 0;
            RightoCF = 0;
            
            cout << "Latest movement is --> by " << latestMovC << ", it's now replayed\n" << endl;
        }
    }
    
    else if(RightoCF == 0 && LeftoCF == 1){
        
        if((Cpos - latestMovC) < 0)
            cout << "ERROR - Robot will go out of bound\n" << endl;
        
        else{
        
            robot[Cpos] = '-';
            robot[Cpos - latestMovC] = '^';
            
            RightoF = 0;
            LeftoF = 0;
            LeftoCF = 0;
            
            cout << "Latest movement is <-- by " << latestMovC << ", it's now replayed\n" << endl;
        }
    }
    
    else
       cout << "No latest movement was cancelled/Latest movement already replayed/Reboot cannot replay\n" << endl; 
}

