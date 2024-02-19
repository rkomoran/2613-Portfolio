name = input("Hello! Please input a name:\n")
age = int(input("Please input an age:\n"))

while age < 0 or age > 122:
    age = int(input("Error with age, please input a new age:\n"))

if age >= 0 and age <= 15:
    print(f'{name} must wait {16 - age} more years to get a driver''s license!')
elif age >= 17 and age <= 122:
    print(f'{name} has been eligible for a driver\'s license for {age - 16} years!')
else:
    print(f'Congrats! {name} can get their driver''s license now!')
