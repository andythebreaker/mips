#include <stdio.h>
struct student{
    
    int mathGrade;
    int csGrade;
    int englishGrade;
} ;

main(){

volatile struct student* A =(struct student*) 0x20000000;
volatile struct student* B =(struct student*) 0x20000020;
struct student s1 = {60,70,70};  
struct student s2 = {70,50,80};  

 *A = s1;
 *B = s2;  
}
