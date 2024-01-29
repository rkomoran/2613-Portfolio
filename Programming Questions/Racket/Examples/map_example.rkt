#lang racket
(define myList '(1 2 3 4))

; expects a function
(map (lambda(x) (* x 2))  myList)
