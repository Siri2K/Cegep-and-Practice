from Student import Student

student1 = Student("Jim","Engineering",3.5,False)
student2 = Student("Pan","Engineering",2.4,True)
student3 = Student("Rico","Demolition",4,True)
student4 = Student("Brock","Gymanistics",2.8,False)

callout = student3
print(callout.name)
print(callout.on_honour_roll())