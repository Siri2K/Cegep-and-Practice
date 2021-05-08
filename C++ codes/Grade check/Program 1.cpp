//Assignment 3, Week 7
//Class Grade Analyser
//Sriram Kanagalingham - 40170212

#include <iostream>
#include <iomanip>
using namespace std;

int MaxGrade(int [], int);
int MinGrade(int [], int);
float Average(int [], int);
int Median(int [], int);
int GradeA(int [], int);
int GradeB(int [], int);
int GradeC(int [], int);
int GradeD(int [], int);
int GradeF(int [], int);

int main(){
    
    int STUDENTS, i;
    
    cout << "Enter the # of students: ";
    cin >> STUDENTS;
    
    while(STUDENTS <=0){
        
        cout << "ERROR - Invaild #. Try again\n" << endl;
        
        cout << "Enter the # of students: ";
        cin >> STUDENTS;
    }
    
    int StudentGrades[STUDENTS];
    
    cout << "----------------------------\n";
    
    for(i = 0; i < STUDENTS; i++){
        
        cout << "Enter grade for student " << i + 1 << ": ";
        cin >> StudentGrades[i];
        
        while(StudentGrades[i] < 0 || StudentGrades[i] > 100){
            
            cout << "ERROR - Invaild # for student " << i + 1 << ". Try again. Must be within [0-100]\n";
            
            cout << "Enter grade for student " << i + 1 << ": ";
            cin >> StudentGrades[i];
        }
    }
    
    cout << "----------------------------\n";
    
    cout << "The highest grade is: " << MaxGrade(StudentGrades, STUDENTS) << endl;
    cout << "The lowest grade is: " << MinGrade(StudentGrades, STUDENTS) << endl;
    cout << "The average grade is: " << Average(StudentGrades, STUDENTS) << endl;
    cout << "The median grade is: " << Median(StudentGrades, STUDENTS) << endl;
    cout << "The amount of As in the list is: " << GradeA(StudentGrades, STUDENTS) << endl;
    cout << "The amount of Bs in the list is: " << GradeB(StudentGrades, STUDENTS) << endl;
    cout << "The amount of Cs in the list is: " << GradeC(StudentGrades, STUDENTS) << endl;
    cout << "The amount of Ds in the list is: " << GradeD(StudentGrades, STUDENTS) << endl;
    cout << "The amount of Fs in the list is: " << GradeF(StudentGrades, STUDENTS) << endl;
 
    return 0;
}

int MaxGrade(int Grades[], int Students){
    
    int Max = 0, i;
    
    for(i = 0; i < Students; i++){
        
        if(Grades[i] > Max)
            Max = Grades[i];
    }
    
    return Max;
}

int MinGrade(int Grades[], int Students){
    
    int Min = 100, i;
    
    for(i = 0; i < Students; i++){
        
        if(Grades[i] < Min)
            Min = Grades[i];
    }
    
    return Min;    
}

float Average(int Grades[], int Students){
    
    int Sum = 0, i;
    
    for(i = 0; i < Students; i++)
        Sum += Grades[i];
    
    return (Sum / (float) Students);
}

int Median(int Grades[], int Students){
    
    int Med, TempG, i, j;
    
    for(i = 0; i < Students; ++i){
        
        for(j = i + 1; j < Students; ++j){
        
            if(Grades[i] > Grades[j]){
            
                TempG = Grades[i];
                Grades[i] = Grades[j];
                Grades[j] = TempG;
            }
        }
    }
    
    if((Students % 2) != 0)
        Med = Students / 2;
    
    else
        Med = (Students / 2) - 1;
    
    return Grades[Med];
}

int GradeA(int Grades[], int Students){
    
    int i, gradeA = 0;
    
    for(i = 0; i < Students; i++){
        
        if(Grades[i] > 80)
            ++gradeA;
    }
    
    return gradeA;
}

int GradeB(int Grades[], int Students){
    
    int i, gradeB = 0;
    
    for(i = 0; i < Students; i++){
   
        if(Grades[i] > 70 && Grades[i] <= 80)
            ++gradeB;
    }
    
    return gradeB;
}

int GradeC(int Grades[], int Students){
    
    int i, gradeC = 0;
    
    for(i = 0; i < Students; i++){
   
        if(Grades[i] > 55 && Grades[i] <= 70)
            ++gradeC;
    }
    
    return gradeC;
}       

int GradeD(int Grades[], int Students){
    
    int i, gradeD = 0;
    
    for(i = 0; i < Students; i++){
   
        if(Grades[i] >= 40 && Grades[i] <= 55)
            ++gradeD;
    }
    
    return gradeD;
}

int GradeF(int Grades[], int Students){
    
    int i, gradeF = 0;
    
    for(i = 0; i < Students; i++){
   
        if(Grades[i] < 40)
            ++gradeF;
    }
    
    return gradeF;
}

