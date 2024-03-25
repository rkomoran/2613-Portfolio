### Table of Contents
- [Which package/library did I select?](#which-library)
- [What is Racket's Drawing Toolkit?](#what-is-package)
- [What are the functionalities of the package/library?](#functions)
- [When was it created?](#created)
- [Why did I select this language?](#why)
- [How did learning this library influence my learning of the language?](#learning)
- [How was my overall experience with the library?](#overall)
# <a name="package-overview"></a>Package/Library Overview

### <a name="which-library"></a>Which package/library did I select?

- The following project uses Racket's Drawing Toolkit library, also known as (__racket/draw__).

## <a name="what-is-package"></a>What is the package/library?

- The __racket/draw__ library lets you make drawings using a system called _PostScript_. You can draw lines, fill shapes, copy images, blend colors, and change the size, rotation, or position of things.

>What purpose does it serve?

- While this toolkit provides a fun toolkit for creating drawings & is entertaining; it also serves as a great way to learn coding and explore artistic concepts.

- There's use of different functions & math involved with the canvas size & where to position your shapes. You'll also grasp how the program reads code in a top-down manner and calls different functions at specific times to display shapes and create the picture accurately.

---
> How do you use it?

- Usage of the package is pretty simple, just include this line after your `#lang racket` at the top of your Racket program, assuming you have Racket already installed.

`(require racket/draw)`

> [!NOTE]
> If you don't have racket installed on your machine, you [can go here](https://docs.racket-lang.org/pollen/Installation.html) to properly install it.

---
- There's quite a few drawing functions that we can use to draw different shapes, here's a few:

`(send dc draw-rectangle 0 10 30 10)`

`(send dc draw-ellipse 47 140 75 75)` 

- Each of these functions have parameters that are as follows:

> `(send a-dc draw-rectangle x y width height)`	 	 	 	 	 	 	 

and

>`(send a-dc draw-ellipse x y width height)`

- In the provided code snippets, __send__ is a special function in Racket that sends a message to an _object_. In this context, dc is an object that represents a drawing context. This allows us to draw & position our shapes on something called a __canvas__.

---
In our program; we can specify a canvas like this:

>`(define target (make-bitmap 300 300))`
---

- This creates a GUI of 300x300 in this case.
- Next, we need to call a function that will let us draw on the new bitmap, this will be:

>`((define dc (new bitmap-dc% [bitmap target]))`

---
- Nice! This is what we've written so far:

```
#lang racket

(require racket/draw)

(define target (make-bitmap 300 300)) ; A 300x300 bitmap
(define dc (new bitmap-dc% [bitmap target]))


(send dc draw-rectangle 0 10 30 10)
(send dc draw-ellipse 47 140 75 75)
```

- Right now, our program is set up to 

1. Call our library
2. Make a canvas of size & width 300x300
3. Give us the ability to draw on this canvas
4. Create two shapes using a call to the '__dc__' object

---
- There's a small issue however; we have no where to save it!

By making another call to the object, we can specify the format in which our canvas will be saved and its filename. For simplicity, let's save it as a __PNG__ file named __"test.png"__.

To accomplish this, we would write `(send target save-file "test.png" 'png)`. This line of code should be placed at the end of our program to ensure that everything we want displayed on the canvas is properly saved.

---

- When running this program, racket will let you know if the operation was successful with a boolean value.

![alt text](image.png)

You'll notice that Racket gives you little indication on _what just happened_. To actually _see_ where your __PNG__ file is, you would navigate to the directory where you made this program.

- Here's what our picture looks like. It's a little ugly.. but; it's all there!

![alt text](image-1.png)

- There's no background, the default colour is white, and there's also a black outline to the shapes.

- This is where the customization comes into play. There are a multitude of functions that can be called to change the background (either to a picture or solid colour), remove outlines, and change colours of shapes.

---
- Here's an example of some customization and good software practice.

`(define background-brush (new brush% [color (make-color 255 210 0)]))`

Let's break this function down:


- `define background-brush`: This line of code creates a new variable named __background-brush__. By using define, we're assigning a value to this variable.
- `(new brush% [color (make-color 255 210 0)])`: Here, we're creating a new instance of the brush% class. Within this instance, we're specifying the color attribute using (make-color 255 210 0). The numbers _255 210 0_ represent the __RGB__ (Red, Green, Blue) values of the desired color. In this case, it's a shade of yellow.

This lets us change our background colour __in one place__. It's an easy to read variable that explains what it holds, and we need to only look in one place to find it.

---
Here's another example:

```
define (draw-body dc)
    (send dc set-pen "white" 1 'transparent)
    (send dc set-smoothing 'smoothed)

    (send dc set-brush "black" 'solid)
    (send dc draw-ellipse
        3.3 165
        296 296))
```

Here, we're creating a new function named `(define (draw-body dc))` that accepts a drawing context __dc__ as an argument. (_the object we call to draw on our canvas_)

- `(send dc set-pen "white" 1 'transparent)`: Now, we're calling a function to set the pen color to white with a thickness of 1 unit. The parameter 'transparent indicates that the pen will have no fill color, resulting in the removal of an outline.

- `(send dc set-smoothing 'smoothed)`: This line instructs the drawing context dc to enable smoothing, which reduces jagged edges of lines; making them smoother.

- `(send dc set-brush "black" 'solid)`: This sets the colour of our '_brush_'. When creating a shape, it uses the color specifed here to fill the shape, in this case; our ellipse shape.

> [!NOTE]
> you __must__ change your brush by calling this function again if you want to use a different colour later on in your program

With this function created, we can call upon it later in the program. We can actually call this function any amount of times, and it will draw a black ellipse with certain __position__ and __size__, with rounded edges, anywhere in our program.



## <a name="functions"></a>What are the functionalities of the package/library?

- To explain the functionality of what pygame can do, I will provide a basic program and outline what the code does.

- We're going to make a program that simply prints a happy face, using the example code provided above and the same software principlies we've discussed.

- First, we need another library for some math. We need this because smiles are hard to draw, but they bring a smile to our face; so it's worth it in the end.

- Next, we're going to define some variables. We'll define some variables that give us __no outlines__ and __clear our brush colour__.

- From there, we're going to define different brush colours. Here's what we've got so far:

```
(require racket/math)
 
(define no-pen (new pen% [style 'transparent]))
(define no-brush (new brush% [style 'transparent]))
(define blue-brush (new brush% [color "blue"]))
(define yellow-brush (new brush% [color "yellow"]))
(define red-pen (new pen% [color "red"] [width 2]))
```

Note the use of `[width 2]`. There's many of these parameters hidden in the library. In this case, it thichens our brush. [Find more here](https://docs.racket-lang.org/draw/brush_.html)

- Let's also add our __cavas__ and ability to draw on that canvas.

```
(define target (make-bitmap 150 150))
(define dc (new bitmap-dc% [bitmap target]))
```
---

Right now, our program doesn't do anything; but, we've provided everything to get us started.

- We're going to create a function that will draw us our happy face, let's call it `(define (draw-face dc))`

This takes in a dc object, this object is what we're referring to when we use our functions. Without this, we can't use any of our functions we know within this function.

---
```
  (send dc set-smoothing 'aligned)
 
  (send dc set-pen no-pen)
  (send dc set-brush blue-brush)
  (send dc draw-ellipse 25 25 100 100)
 
  (send dc set-brush yellow-brush)
  (send dc draw-rectangle 50 50 10 10)
  (send dc draw-rectangle 90 50 10 10)
 
  (send dc set-brush no-brush)
  (send dc set-pen red-pen)
  (send dc draw-arc 37 37 75 75 (* 5/4 pi) (* 7/4 pi)))
  ```

  All the code above uses what we've seen. We use our variables that change brush colours, clears brush colour for another one to be used, removes outlines, and creates shapes.

  Finally, let's call our function so it can be created and specify what format it will have and where it will be saved (_in our code directory_)

  `(draw-face dc)`
  `(send target save-file "face.png" 'png)`

  - Here's how our code looks like now:

  ```
  (require racket/math)
 
(define no-pen (new pen% [style 'transparent]))
(define no-brush (new brush% [style 'transparent]))
(define blue-brush (new brush% [color "blue"]))
(define yellow-brush (new brush% [color "yellow"]))
(define red-pen (new pen% [color "red"] [width 2]))
 
(define (draw-face dc)
  (send dc set-smoothing 'aligned)
 
  (send dc set-pen no-pen)
  (send dc set-brush blue-brush)
  (send dc draw-ellipse 25 25 100 100)
 
  (send dc set-brush yellow-brush)
  (send dc draw-rectangle 50 50 10 10)
  (send dc draw-rectangle 90 50 10 10)
 
  (send dc set-brush no-brush)
  (send dc set-pen red-pen)
  (send dc draw-arc 37 37 75 75 (* 5/4 pi) (* 7/4 pi)))
 
(define target (make-bitmap 150 150))
(define dc (new bitmap-dc% [bitmap target]))
 
(draw-face dc)
(send target save-file "box.png" 'png)
```
---

![alt text](image-2.png)

Look at that smile, isn't he beautiful?

## <a name="created"></a>When was it created?

- This library was included with the default Racket language. With that being said, this library was created by Matthias Felleisen founded PLT Inc. in the mid 1990s.

## <a name="why"></a>Why did I select this language?

- I chose this language becaused I wanted to improve, in my own opinion, the hardest programming language in this class. 

## <a name="learning"></a>How did learning this library influence my learning of the language?

- This library helped me with variable defition & function defition. It also taught me a lot about sustainable code. I broke down my project by incorporating different parts of my drawing into sections. So if I needed to fix something, it would be in a section -- and I wouldn't have to go searching for it in a sea of code.

- Although we're learning about objects now, I learned about them when doing this EA. I had no idea what '__dc__' was and why it kept getting called in each function. I looked it up and saw the structure of how an object was made. I also figured out that the reason why every function begins with '__send__' was due to an object call (_to dc_).

## <a name="overall"></a>How was my overall experience with the library?

- Overall, I really enjoyed this library. It was nice that it was included with the base Racket language; so all that was needed was a simple '__require__' field.

- The documentation provides great examples of how to use it, and it can get very in depth; not only with the code -- but with what you can draw.

- I only scratched the surface with my project, but even with that; I felt that I learned a lot about the library and it's capabilities.
