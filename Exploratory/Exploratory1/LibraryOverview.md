### Table of Contents
- [Package/Library Overview](#when-was-it-created?)
# Package/Library Overview

### Which package/library did I select?

- I used the __pygame__ library for python.

## What is Pygame?

>What purpose does it serve?

- "**Pygame** is a set of [Python](http://www.python.org) modules designed for writing video games. This allows you to create fully featured games and multimedia programs in the python language." [ref](https://www.pygame.org/wiki/about)

- It aims to provide an easy way to make games using programming. The code is simple and most ideas are already created for you by their functions

- The code itself is highly optimized -- the code within the library is actually made in C [ref](https://www.pygame.org/wiki/about). This means that the games can be run on virtually any system and accessible to different OSs.
---
> How do you use it?

- To use pygame; you would need to install Python and Pygame. Once Python is installed, installing pygame is as simple as writing ```python3 -m pip install -U pygame``` in your terminal.

- All of your code creation will begin after these two lines in your code
	```python
	import pygame
	pygame.init()
```

- These two lines of code initialises your program to note that the library is being used with the import statement, and the `pygame.init()` initialises the pygame engine. You __must__ include these two lines in order to write any pygame code

---
- Pygame uses a _loop_ to process the evens that occur on the screen
	- The standard convention looks something like this:
		```python
		running = True
		while running:
			# code stuff
			pygame.display.update()
		```
- Note that the following loop is an infinite loop -- that's normal. We usually want an event to occur in the game that turns this boolean value into a ```False```

- The code at the bottom is where all of the changes are made in the program. It constantly checks if there is a new element to be shown on our screen and displays it until the game terminates

---

- Defining user input is categorised as __"Events"__ in pygame. This could be things such as clicking the screen, typing on your keyboard, pressing a button.
	- This single command will _listen_ for inputs and map what the input was
		```python
		pygame.event.get()
```
- You can then use conditionals to check what the said input was. Going back to our infinite loop example, we can end the game in the following manner by checking if the user wants to quit the game
	```python
	if event.type == pygame.QUIT:
		running = False
```

---
- For every game, we also need to create a window to display it in. In pygame, and many other game libraries where X and Y co-ordinates are involved, we can use this following picture to help us understand how they work
	 ![[Pasted image 20240209123254.png]]
	 Our x values grow larger form left - right & our y values grow from top - down [ref](https://coderslegacy.com/python/python-pygame-tutorial/)


- So, setting up our display with a 300 by 300 grid would look something like this in pygame
	```python
	screen = pygame.display.set_mode((300, 300))
```

---

- Once you have these set, you're pretty much ready to start using it! The juicy stuff comes from inheriting previous classes. I inherited the `pygame.sprite.Sprite` object to allow the use of pictures in my program. Once you inherit a class like that, it opens up even more methods for you to use in your program.

- The good thing about pygame is that it is widely used & there are a ton of tutorials out there

## What are the functionalities of the package/library?

- To explain the functionality of what pygame can do, I will provide a basic program and outline what the code does.

- We're going to make a program that simply prints a shape where ever we click. This incorporates everything we talked about to this point, but we'll be adding in some data structures & shapes

	```python
	import pygame
	pygame.init()
	screen = pygame.display.set_mode((600, 600))
	screen.fill((255, 255, 255))
	
	running = True
	while running:
		pygame.display.update()
```

- This code is similar to the code we saw above. We're making the game by using the library, we set a GUI of 600 by 600 with the background white, and we have the while loop currently running forever

![[Pasted image 20240209125729.png]]

- We will now add in conditionals in our loop, as well as an array to hold all the different positions our mouse has clicked on the screen. Here, I used a print statement for us to see the array working 

![[Pasted image 20240209130308.png]]

```python
position_counter = []
circle_color = (20, 50, 120)

running = True
while running:

	for event in pygame.event.get():
		if event.type == pygame.QUIT:
			running = False
	
		elif event.type == pygame.MOUSEBUTTONDOWN:
			position_counter.append(event.pos)
			print(position_counter)
	
	pygame.display.update()
```

- I also added in the colour of the circle as a variable -- so we don't have to keep writing it.
- Note the use of `event.pos`, this gives us an x and y position value depending on where we clicked with our mouse on the screen. [ref](https://gamedevacademy.org/event-pos-pygame-tutorial-complete-guide/)

![[Pasted image 20240209171841.png]]

- We now have a shape, in this case circles, spawning where ever we click on our screen.

```python
for position in position_counter:
	pygame.draw.circle(screen, circle_color, position, 60)
```

- The code above makes a circle by calling pygame's _draw_ method, and we pass in the surface it will be drawn on, it's colour, the center point of the circle, and it's radius. [ref](https://www.pygame.org/docs/ref/draw.html#pygame.draw.circle)

- This is our whole code now

```python
import pygame

pygame.init()
screen = pygame.display.set_mode((600, 600))

screen.fill((255, 255, 255))
position_counter = []
circle_color = (20, 50, 120)

running = True
while running:

	for event in pygame.event.get():
		if event.type == pygame.QUIT:
			running = False
	
		elif event.type == pygame.MOUSEBUTTONDOWN:
			position_counter.append(event.pos)
			print(position_counter)
			
		for position in position_counter:
		pygame.draw.circle(screen, circle_color, position, 60)
		
	pygame.display.update()
```

- As you can see, the code is very minimal & easy to understand. One of the greats things about this library!

## <a name="when-was-it-created?"></a>When was it created?

- Pygame was created in October, 2000 by Pete Shinners [ref](https://www.pygame.org/docs/tut/PygameIntro.html)

## How did learning this library influence my learning of the language?

- This library enhanced my overall abilities of Python. When it came to syntax, variable assignment, conditionals, loops; I all had experience with it prior -- but working with this library focuses on these features much more.

- One thing that really helped me out were classes and inheritance in Python. In order to use my pictures -- I had to inherit from the `pygame.sprite.Sprite` class, and use super. I also got to see how to declare variables in a class with `self`

## How was my overall experience with the library?

- Overall, I was very pleased with how easy it was to use. The installation of the library and set up was very easy. Learning that the library is basically just a loop where you can add in elements progressively to be shown on screen was a fairy simple concept to understand.

- One thing I really enjoyed about this library is the amount of resources out there for learning it. Just the official documentation is jam-packed with tutorials & other information which makes it very easy for me to recommend to someone.

- I want to keep using this library for future projects. Although it seems like it's limited to simple projects, there have been more complex ones that are pretty impressive. Maybe I'll make a Frog Jumper instead of a Frog Spawner?