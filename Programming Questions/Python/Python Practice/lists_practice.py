# making a simple list

stuff = ["Hi", 45, False, 12.0]
print(stuff)

# can append to end of list
stuff.append("Hello")
print(stuff)

# can add multiple lists together
# most of the methods applied to list return void
moreStuff = ["Yo", 3.1415, 'C']
moreStuff.extend(stuff)
print(moreStuff)

# can remove stuff from end of list
# if you do not specify an index for pop, it will remove last item by default
stuff.pop()
print(stuff)

# can also access last element by using pop
lastElement = stuff.pop()
# prints 12.0
print(lastElement)

# list comprehension
# short hand for loop
myList = ["Hi", "Test", "More Stuff", "Hello"]
newList = [(word.upper()) for word in myList]
print(newList)

# more examples

# containsA = [expression for item in iterable if condition == True]
# this just appends stuff to the list if the condition is true

fruits = ["apple", "banana", "cherry", "kiwi", "mango"]
containsA = [word for word in fruits if "a" in word]

print(containsA)

# range returns a list of indices from 0 to n − 1, where n is the length of the list.
numbers = [1, 2, 3, 4, 5]
i = 0
for i in range(len(numbers)):
    numbers[i] = numbers[i] * 2
print(i)
print(f'Length of numbers: {len(numbers)}')

# The + operator concatenates lists:
a = [1, 2, 3]
b = [4, 5, 6]
c = a + b
print(c)
# output [1, 2, 3, 4, 5, 6]

# The * operator repeats a list a given number of times:
print([0] * 4)
# output [0, 0, 0, 0]

print(f'Output: {[1, 2, 3] * 3}')
# output [1, 2, 3, 1, 2, 3, 1, 2, 3]

# The first example repeats [0] four times. The second example repeats the list [1, 2, 3]
# three times.



# converting a string (word) in individual chars (in a list)

s = "word"
print(f'Converted string into list: {list(s)}')

# or converting sentence into individual words (in a list)
# split() with no 
phrase = "I am a frog and I'm eating some bugs"
print(f'Converted sentence to words: {phrase.split()}')


# stuff to try out from thinkpython2

t = [1, 2, 3]
x = 4

# t += [x]
# also prints [1, 2, 3, 4]

# t + [x]
# prints original array, it is a string method so it returns something

# t = t.append(x)
# prints None, method is void

# t.append(x)
# prints [1, 2, 3, 4]

# t.append([x])
# prints [1, 2, 3, [4]]


# t = t + [x]
# prints [1, 2, 3, 4]
# concats list to list

# testing output
# print(t)


# have to return list to see the modified list
# not like C with pointers
def adder(list):
    newNums = [x+1 for x in list]
    return newNums

nums = [1, 2, 3]
print(adder(nums))

