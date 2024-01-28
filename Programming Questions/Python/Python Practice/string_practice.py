# basic slicing

b = "Hello, World"
# slicing -- does not include end limit
print(b[2:5])

# range will start at first character
# can do the same with end
print(b[:5])

# modifying strings

a = "This is a test"
# prints upper
print(a.upper())
print(a.lower())

# strips any leading or trailing whitespace
c = "     Loads of whitespace    "
print(c.strip())

# splits words based on parameter
# default case is white space
# returns a list
print(a.split())
print(type(a.split()))

# formatting strings (super useful)
# can add escape characters here but print auto-matically gives a new line
age = 24
print(f'My name is Rinor and I am {age} years old!')

# can also do it like this using format()
quantity = 3
item = "turkeys"
price = 50.64
string = "I want to pay {2} dollars for {0} pieces of {1}."
print(string.format(quantity, item, price))

# accessing strings
# much like in C
txt = "What's up"
print(txt[2])

