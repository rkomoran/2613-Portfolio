#lang racket

(define (fib n)
  (cond [(equal? 1 n)
         1]
        [(equal? 0 n)
         0]
        [else (+ (fib(- n 1)) (fib(- n 2)))]))

(fib 13)

(define (larger-rectangle l1 w1 l2 w2)
  (cond [(< (* l1 w1) (* l2 w2))
           1]
        [(> (* l1 w1) (* l2 w2))
           -1]
        [(= (* l1 w1) (* l2 w2))
           0]))

(larger-rectangle 3 5 2 4)