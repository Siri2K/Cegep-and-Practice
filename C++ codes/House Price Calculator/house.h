// Sriram Kanagalingham, ID:40170212
// Assignment 4, Program 3
// Takes the user inputs and save them in house.cpp

#include <iostream>
#include <cmath>
using namespace std;

class House{
    
    private:
        int age, rooms;
        string type;
        double price;
        
    public:
        House(int, string, int, double);
        
        void Set_age(int);
        void Set_type(string);
        void Set_rooms(int);
        void Set_price(double);
        
        double estimatePrice(string, int, double);
        
        int Get_age(){
            
            return age;
        }
        
        string Get_type(){
            
            return type;
        }
        
        int Get_rooms(){
            
            return rooms;
        }
        
        double Get_price(){
            
            return price;
        }
};