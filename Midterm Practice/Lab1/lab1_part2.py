import math
def abs(n):
    if n < 0:
        n = n * -1
        return n
    else:
        return n

def formula():
    while True:
        print("Input two values:")
        a = input()
        b = input()

        if 'X' in a or 'X' in b:
            break
        else:
            a = float(a)
            b = float(b)

        result = math.sqrt(abs((a - 1)**5 - (b + 1)))

        print(f'Result:\n{result}')

formula()