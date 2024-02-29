#lang racket

(define (final_velocity time)
  (define vi 32)
  (define a -0.35)
  (+ vi (* a time)))

(define (matching lst1 lst2 num)
  (cond [(or (<= (length lst1) num) (<= (length lst2) num)) -1]
        [(< (abs(- (list-ref lst1 num) (list-ref lst2 num))) 1) num]
        [else
         (matching lst1 lst2 (+ 1 num))]))



(matching '(6 2 4 7 8 9) '(1 5 7 3 7.5 9) 0)
(matching '(6 2 4 7) '(1 5 7 3) 0)