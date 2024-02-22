# 1. The function should take a single value and return the value multiplied by 2

num = 2
result = (lambda x: x * 2)(num)
print(result)

num = [1, 2, 3, 4, 5]
result = map(lambda x: x * 2, num)
print(list(result))


# 2. The function should take a string and return the character in the centre of the string.
# In other words, if the string is of length 9, return the 4th and if the string is of length
# 12, return the 6th character. Not necessary but may be helpful to research rounding in
# Python.

test = "Hell"
result = (lambda string: string[((len(string) - 1) // 2)])(test)
print(result)

# 3. The function should take a single value and return true if the value is odd and positive and
# will return false otherwise.

test = 5
result = False if (lambda x: x % 2 != 0 and x > 0)(test) else True
print(result)

# 4. This function should take a string and return true if the string starts with a vowel character:
# A, E, I, O, or U. The functions returns false otherwise.

test = "Apple"
result = True if (lambda string: string[0].upper() in ['A', 'E', 'I', 'O', 'U'])(test) else False
print(result)