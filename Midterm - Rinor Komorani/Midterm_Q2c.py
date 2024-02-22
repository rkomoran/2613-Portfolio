file = input("Please input a file name\n")

fopen = open(file, "r")
read_file = fopen.read()

# make the file into a list
file_list = read_file.split()

# gets average
total = 0
count = 0
for num in file_list:
    if float(num) >= 0 and float(num) <= 100:
        total += float(num)
        count += 1
avg = total/count

# performs grade calculation
array_grade = ['A', 'B', 'C', 'D', 'F']
array_counter = [0, 0, 0, 0, 0]
for num in file_list:
    if (float(num) >= 80 and float(num) <= 100):
        array_counter[0] += 1
    if (float(num) >= 65 and float(num) <= 79.99):
        array_counter[1] += 1
    if (float(num) > 55 and float(num) < 64.99):
        array_counter[2] += 1
    if (float(num) > 50 and float(num) < 54.99):
        array_counter[3] += 1
    if (float(num) > 0 and float(num) < 49.99):
        array_counter[4] += 1

for i in array_counter:
    print(f'{i}\n')

avg_count = 0
for num in file_list:
    if float(num) > avg and float(num) <= 100:
        avg_count += 1

print(f'Valid grades above Average: {avg_count}')
