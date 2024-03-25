# Library Overview

## What package/library does this sample program run?
- The following project uses Racket's Drawing Toolkit library, also known as (__racket/draw__).

## What is the package/library?
- The __racket/draw__ library lets you make drawings using a system called _PostScript_. You can draw lines, fill shapes, copy images, blend colors, and change the size, rotation, or position of things.

---
> What purpose does it serve?
- While this toolkit provides a fun toolkit for creating drawings & is entertaining; it also serves as a great way to learn coding and explore artistic concepts.

- There's use of different functions & math involved with the canvas size & where to position your shapes. You'll also grasp how the program reads code in a top-down manner and calls different functions at specific times to display shapes and create the picture accurately.

---
> How do you use it?

- Usage of the package is pretty simple, just include this line after your `#lang racket` at the top of your Racket program.

`(require racket/draw)`

- There's quite a few drawing functions that we can use to draw different shapes, here's a few:

`(send dc draw-rectangle 0 10 30 10)`

`(send dc draw-ellipse 47 140 75 75)`

- Each of these functions have parameters that are as follows:

> `(send a-dc draw-rounded-rectangle x y width height)`	 	 	 	 	 	 	 

and

>`(send a-dc draw-ellipse x y width height)`

- That we can use to position our shapes on something called a __canvas__. In our program; we can specify a canvas like this:

>`(define target (make-bitmap 300 300))`

- This creates a gui of 300x300 in this case. Next, we need to call a function that will let us draw on the new bitmap, this will be:

>`((define dc (new bitmap-dc% [bitmap target]))`

- Nice! This is what we've written so far:






