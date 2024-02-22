# Using the mapping function and the functions you have created for Task #1:
# 1. Print the following list of values multiplied by 2:
# [8,10,7.5]
my_list = [8,10,7.5]
print(list(map(lambda x: x * 2, my_list)))

# 2. Print the middle character for each string in the following list:
# ["Hello!", "CompSci2613", "Lab-12"]
my_list = ["Hello!", "CompSci2613", "Lab-12"]
print(list(map(lambda string: string[((len(string) - 1) // 2)], my_list)))

# 3. Print only the elements of the list that are positive odd values:
# [-15, -4, 0, 4, 23, 64, 101, 104, 123]
my_list = [-15, -4, 0, 4, 23, 64, 101, 104, 123]
print(list(filter(lambda x: x % 2 != 0 and x > 0, my_list)))

# 4. Print only the elements of the list that start with vowels:
# ["alice", "bob", "Carl", "daisy", "Earl"]

my_list = ["alice", "bob", "Carl", "daisy", "Earl"]
print(list(filter(lambda string: string[0].upper() in ['A', 'E', 'I', 'O', 'U'], my_list)))