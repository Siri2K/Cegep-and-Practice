// Sriram Kanagalingham, ID:40170212
// Assignment 4, Program 3
// Takes the user inputs and save them in house.cpp

#include "house.h"

House::House(int old, string Htype, int Brooms, double cost){
    
        Set_age(old);
        Set_type(Htype);
        Set_rooms(Brooms);
        Set_price(cost);
}

void House::Set_age(int old){
    
    age = old;
}

void House::Set_type(string Htype){
    
    type = Htype;
}

void House::Set_rooms(int Brooms){
    
    rooms = Brooms;
}

void House::Set_price(double cost){
    
    price = cost;
}

double House::estimatePrice(string Htype, int old, double cost){
    
    double Fprice;
    
    if(Htype == "Attached"){
        
        if(old <=5) Fprice = cost * pow(1 + (1/100.00), old);
        
        else{
            
            Fprice = cost * pow(1 + (1/100.00), 5);
            Fprice += cost * pow(1 + (2/100.00), old - 5);
        }
    }
    
    else if(Htype == "Semiâ€Attached"){

        if(old <=5) Fprice = cost * pow(1 + (2/100.00), old);
        
        else{
            
            Fprice = cost * pow(1 + (2/100.00), 5);
            Fprice += cost * pow(1 + (3/100.00), old - 5);
        }
    } 
        
    else if(Htype == "Detached") Fprice = cost * pow(1 + (2/100.00), old);
    
    else Fprice = 0;
        
    
    return Fprice;    
}
