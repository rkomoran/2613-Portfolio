#lang racket

(define (fib n)
  (cond [(equal? n 0)
         0]
        [(equal? n 1)
         1]
        [(+ (fib (- n 1)) (fib (- n 2)))]))


(define (larger-rectangle l w l2 w2)
  (cond [(> (* l w) (* l2 w2))
           1]
        [(< (* l w) (* l2 w2))
           -1]
        [(equal? (* l w) (* l2 w2))
         0]))
