#lang racket

(define (accel t)
  (define vi 5)
  (define a 0.5)
  (+ (* a t) vi))

(define (decel t)
  (define vi 32)
  (define a -0.35)
  (+ (* a t) vi))

(define (list-60)
  (build-list 61 values))

(define (matching list1 list2 num)
  (cond [(or (<= (length list1) num) (<= (length list2) num)) -1]
        [(< (abs (- (list-ref list1 num) (list-ref list2 num))) 1) num]
        [else
         (matching list1 list2 (+ 1 num))]))

(define (same-speed acc dcc times num)
  (matching (map acc times) (map dcc times) num))

(same-speed accel decel (list-60) 0)