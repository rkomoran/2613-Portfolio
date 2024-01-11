import math

def absolute(n):
    if (n) < 0:
        return n * -1
    else:
        return n

def formula(a, b):
    return math.sqrt(((a - 1) ** 5) - (absolute(b) + 1))

while True:
    print("Input two values:\n")
    a = input()
    if a == "X":
        break
    else:
        a = float(a)
        b = float(input())
        result = formula(a, b)

        print("Result: " + str(result))
