name = input("Hello! Please input a name!\n")

while True:
    age = int(input("Please input an age:\n"))
    if age < 0 or age > 122:
        input("Error with age, plase input a new age:\n")
    else:
        break


if age >= 0 and age <= 15:
    print(str(name) + " must wait " + str((16 - age)) + " more years to get a driver's license!")
else:
    if age == 16:
        print("Congrats! " + name + " can get their driver's license now!")
    else:
        if age > 16:
            print(name + " has been eligible for a driver's license for " + str((age - 16)) + " years!")
