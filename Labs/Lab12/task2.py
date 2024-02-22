# Write a lambda function that takes two values and returns the higher of the two values. If the values
# are equal, just return the value. Call the function with two values and print the result in at least 2
# appropriate test cases

num1 = 50
num2 = 51

print((lambda x, y: x if x >= y else y)(num1, num2))