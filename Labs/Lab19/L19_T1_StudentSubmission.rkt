#lang racket
(require racket/class)

(define point% (class object%
                   (super-new)
                 ;; using send to get the instance variable of other object
                 (define/public (distance other) (sqrt (+ (expt (- (send other get-x) x) 2) (expt (- (send other get-y) y) 2))))
                 ;;(define/public (set-x nx) (= x nx))
                 (define/public (set-x nx) (set! x nx))
                 ;;(define/public (set-y ny) (= y ny))
                 (define/public (set-y ny) (set! y ny))
                 (define/public (get-x)
                   x)
                 (define/public (get-y)
                   y)
                 
                 ;; this is an initialization variable
                 ;; can be accessed from methods only from init-field
                 ;; this is used as a constuctor (allows passing in of values when creating object)
                   (init-field x y)))

(define p1 (make-object point% 9 3))
(define p2 (make-object point% -1 2))
(printf "Distance calculation: ~a\n" (send p1 distance p2))

;; testing accessor methods
(printf "Testing accessor x for p1: 9 == ~a\n" (send p1 get-x))
(printf "Testing accessor y for p1: 3 == ~a\n" (send p1 get-y))

;; testing mutator methods
;; originally, this is testing if they are equal.
(send p1 set-x 10)
(printf "Testing if mutator for x p1 worked: 10 == ~a\n" (send p1 get-x))

(send p1 set-y 4)
(printf "Testing if mutator for y p1 worked: 4 == ~a\n" (send p1 get-y))


