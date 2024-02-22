def func():
    print("hi")

# can assign func this way
    
my_function = func
my_function()

# can even use it in a list

objects = ["frog", func, 21]
objects[1]()

# can also pass a function to a function

def inner():
    print("I am function inner()")

def outer(function):
    function()

outer(inner)

# can also return functions

def outer():
    def inner():
        print("I'm the inner function")
    
    return inner

function = outer()

function()
# prints I'm the inner function

outer()()
# prints I'm the inner function

# some lambda stuff

result = (lambda s: s[::-1])("This is a string")
print(result)

# lambdas cannot contain return statements or assignments. Nor can it contain control structures
# like for, while, if, else or def

# it can return multiple statements like this though:

def func(x):
    return x, x ** 2, x **3

print(func(3))
# this is a 'tuple'
# Output: (3, 9, 27)

# lambda way

print(f'{(lambda x: [x, x**2, x**3])(3)}')


# some filter stuff

print(list(filter(lambda n: n % 2 == 0, range(10))))
# [0, 2, 4, 6, 8]

for i in (filter(lambda x: x.isupper(), ["frog", "FROG", "RIBBIT"])):
    print(i)
# FROG
# RIBBIT