#lang racket

;Q1

; this defines variables -- variable assignment
(define x 2.5)
(define y 3.5)
(displayln (cond [(> (* x 2) (* y 1.5)) 5]
                 [(< (* x 2) (+ y 1.5)) 3]
                 [(= (* x 2) (+ y 1.5)) 10]))

; displays 10 since they are equal

;Q2

; converts char ASCII into integer and preforms addition of them
(displayln (+ (char->integer #\5) (char->integer #\6)))

;Q3

(display "Hello")
;(displayln "World")  this is a comment, will not displau
(displayln #\!)

;Q4

(define (mystery x)
  ; if the number is less than 20, return that whole number + the last num of the number
  (cond [(< x 20) x]
        [else (+ (remainder x 10) (mystery(quotient x 10)) )]))

(displayln (* -1 (mystery 13583)))
(define z (mystery 2334683))
(displayln z)
(displayln (* z (mystery 19754)))
