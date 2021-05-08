// Sriram Kanagalingham, ID:40170212
// Assignment 4, Program 3
// Test the house class 

#include "house.h"

int main(){

    int age[2], rooms[2];
    string type[2];
    double price[2];
    
    for(int i = 0; i <= 1; i++){
        
        cout << "For house #" << i + 1 << " that you own, enter its type [Detached, Semi‐Attached, or Attached]: ";
        cin >> type[i];
        
        while(type[i] != "Detached" && type[i] != "Attached" && type[i] != "Semi‐Attached"){
            
        cout << "ERROR - Invalid Input\n" << endl;
            
        cout << "For house #" << i + 1 << " that you own, enter its type [Detached, Semi‐Attached, or Attached]: ";
        cin >> type[i];
        }
        
        cout << "Enter the age of your house: ";
        cin >> age[i];
        
        while(age[i] <=0){
            
        cout << "ERROR - Invalid Input\n" << endl;
            
        cout << "Enter the age of your house: ";
        cin >> age[i];
        }
        
        cout << "Enter the # of rooms your house has: ";
        cin >> rooms[i];
        
        while(rooms[i] <=0){
            
        cout << "ERROR - Invalid Input\n" << endl;
            
        cout << "Enter the # of rooms your house has: ";
        cin >> rooms[i];  
        }
        
        cout << "Enter the cost of your house: $";
        cin >> price[i];
        
        while(price[i] <=0){
            
        cout << "ERROR - Invalid Input\n" << endl;
            
        cout << "Enter the cost of your house: $";
        cin >> price[i];  
        }
        
        cout << "--------------------------------------------------------------------------" << endl;
        
        if(i == 0){
            
            House H1(age[i], type[i], rooms[i], price[i]);
            
            cout << "House #" << i + 1 << endl;
            cout << "Type: " << H1.Get_type() << endl;
            cout << "Rooms: " << H1.Get_rooms() << endl;
            cout << "Age: " << H1.Get_age() << endl;
            cout << "Cost: $" << H1.Get_price() << endl;
            cout << "New estimated price: $" << H1.estimatePrice(H1.Get_type(), H1.Get_age(), H1.Get_price()) << endl;
            
            cout << "--------------------------------------------------------------------------" << endl;
        }
        
        else{

            House H2(age[i], type[i], rooms[i], price[i]);
            
            cout << "House #" << i + 1 << endl;
            cout << "Type: " << H2.Get_type() << endl;
            cout << "Rooms: " << H2.Get_rooms() << endl;
            cout << "Age: " << H2.Get_age() << endl;
            cout << "Cost: $" << H2.Get_price() << endl;
            cout << "New estimated price: $" << H2.estimatePrice(H2.Get_type(), H2.Get_age(), H2.Get_price()) << endl;  
            
            cout << "--------------------------------------------------------------------------" << endl;
        }
    }
    
    
    return 0;
}