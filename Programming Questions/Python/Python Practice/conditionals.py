# short hand if else
a = 2
b = 330
print("A") if a > b else print("B")

# can combine if elses in one line
a = 330
b = 330
print("A") if a > b else print("=") if a == b else print("B")

# and
a = 200
b = 33
c = 500
if a > b and c > a:
  print("Both conditions are True")

# or
a = 200
b = 33
c = 500
if a > b or a > c:
  print("At least one of the conditions is True")

# not
a = 33
b = 200
if not a > b:
  print("a is NOT greater than b")