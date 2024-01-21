import math

file = open("DataInput.txt", "r")
content=file.readlines()

# remove newline characters from each line
for i in range(len(content)):
    content[i] = content[i].strip()
    
def sum(n):
    sum = 0;
    for i in n:
        sum += i
    return sum

def avg(n):
    return sum(n) / len(n)

def max(n):
    largest = n[0];
    for i in n:
        if i > largest:
            largest = i
    return largest

def min(n):
    smallest = n[0];
    for i in n:
        if i < smallest:
            smallest = i
    return smallest

def fxp(n):
    computedNums = []
    for z in n:
        currListNums = []
        for k in range(50):
            currListNums.append((z**k) / math.factorial(k))
        computedNums.append(sum(currListNums))
    return computedNums

def fpo(n):
    computedNums = []
    for z in n:
        currListNums = []
        for k in range(50):
            currListNums.append(k * (((z**k) / math.factorial(k))))
        computedNums.append(sum(currListNums))
    return computedNums

def fsn(n):
    computedNums = []
    for z in n:
        currListNums = []
        for k in range(50):
            currListNums.append((((-1)**k) * (z**((2*k) + 1))) / math.factorial((2 * k) + 1))
        computedNums.append(sum(currListNums))
    return computedNums

def fcs(n):
    computedNums = []
    for z in n:
        currListNums = []
        for k in range(50):
            currListNums.append((((-1)**k) * z**(2 * k)) / math.factorial(2 * k))
        computedNums.append(sum(currListNums))
    return computedNums

# finding & calling calculations

i = 0

output_file = open("PQ2DataOutput.txt", "w")

for line in content:
    if line == "SUM":
        i += 1
        numVal = int(content[i])
        currListNums = [] 
        
        for j in range(numVal):
            i += 1
            currListNums.append(float(content[i]))
        i += 1
        output_file.write(f"SUM: {sum(currListNums)}\n")
    if line == "AVG":
        i += 1
        numVal = int(content[i])
        currListNums = []

        for j in range(numVal):
            i += 1
            currListNums.append(float(content[i]))
        i += 1
        output_file.write(f"AVG: {avg(currListNums)}\n")    
    if line == "MAX":
        i += 1
        numVal = int(content[i])
        currListNums = []

        for j in range(numVal):
            i += 1
            currListNums.append(float(content[i]))
        i += 1
        output_file.write(f"MAX: {max(currListNums)}\n")
    if line == "MIN":
        i += 1
        numVal = int(content[i])
        currListNums = []

        for j in range(numVal):
            i += 1
            currListNums.append(float(content[i]))
        i += 1
        output_file.write(f"MIN: {min(currListNums)}\n")
    if line == "FXP":
        i += 1
        numVal = int(content[i])
        currListNums = []

        for j in range(numVal):
            i += 1
            currListNums.append(float(content[i]))
        i += 1
        result = fxp(currListNums)
        output_file.write("FXP:\n")
        for k in range(len(result)):
            output_file.write(f"{k + 1}: {result[k]}\n")
    if line == "FPO":
        i += 1
        numVal = int(content[i])
        currListNums = []

        for j in range(numVal):
            i += 1
            currListNums.append(float(content[i]))
        i += 1
        
        result = fpo(currListNums)
        output_file.write("FPO:\n")
        for k in range(len(result)):
            output_file.write(f"{k + 1}: {result[k]}\n")
    if line == "FSN":
        i += 1
        numVal = int(content[i])
        currListNums = []

        for j in range(numVal):
            i += 1
            currListNums.append(float(content[i]))
        i += 1
        
        result = fsn(currListNums)
        output_file.write("FSN:\n")
        for k in range(len(result)):
            output_file.write(f"{k + 1}: {result[k]}\n")
    if line == "FCS":
        i += 1
        numVal = int(content[i])
        currListNums = []

        for j in range(numVal):
            i += 1
            currListNums.append(float(content[i]))
        i += 1
        
        result = fcs(currListNums)
        output_file.write("FCS:\n")
        for k in range(len(result)):
            output_file.write(f"{k + 1}: {result[k]}\n")
