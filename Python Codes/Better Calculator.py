from math import *
def Calculate(num1,op,num2):
    if op == "+":
        print(num1+num2)
    elif op =="-":
        print(num1-num2)
    elif op =="*":
        print(num1*num2)
    elif op =="/":
        print(num1/num2)
    elif op =="^":
        print(num1^num2)
    else:
        print("Invalid operator")
        
Calculate(float(input("Enter First Number: ")),input("Enter Operator: "),float(input("Enter Second Number: ")))