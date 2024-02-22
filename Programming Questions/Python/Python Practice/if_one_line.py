# can write an if statement in 1 line

# if <expression>: <stuff to do>

if 1 < 2: print("1 is less than 2")

# can also have multiple different functions if true

# find all factors of number
def factors(n):
    # here, we need to define the range from 1 since we cannot start from 0 due to the modulo
    # also, the upper bound of the range is exclusive, so had to have n + 1 to check for n
    to_return = [factor for factor in range(1, n + 1) if n % factor == 0]
    return to_return

num = 45
if (type(num) == int): print("Correct data type given"); print(factors(num))

# can also do if else in one line

# map takes a function & an iterable
# applies that function to each element in the iterable
# have to use map here to be able to concat to the current string.

# join() literally joins elements from an iterable with string concatenation. can specify how to join each element
result = f'There are other factors in {num} other than 1 & {num}: ' + ' '.join(map(str, factors(num))) if len(factors(num)) > 2 else f'There are no factors in {num} another than 1 & {num}'

print(result)