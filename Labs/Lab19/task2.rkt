#lang racket
(require racket/class)

(define point% (class object%
                   (super-new)

                   ; method to caluclate and return the Eucliean distance between the two points
                   (define/public (distance other) (sqrt (+ (expt (- (send other get-x) x) 2) (expt (- (send other get-y) y) 2) (expt (- (send other get-z) z) 2))))

                   ; method to caluclate if two points are a certain distance apart
                   (define/public (distance-range other distance-apart)
                     (let ([d1 (send this distance other)])
                       (if (<= d1 distance-apart) #t #f)))

                   ; method to calculate triangle perimeter
                   (define/public (triangle-perimeter other1 other2)
                     (let ([p1 (send this distance other1)]
                           [p2 (send this distance other2)]
                           ;[p3 (send new this% other1 distance other2)]
                           [p3 (sqrt (+ (expt (- (send other1 get-x) (send other2 get-x)) 2)
                                        (expt (- (send other1 get-y) (send other2 get-y)) 2)
                                        (expt (- (send other1 get-z) (send other2 get-z)) 2)))])
                       (+ p1 p2 p3)))
                   
                   ;; getters & setters
                   (define/public (set-x nx) (set! x nx))
                   (define/public (set-y ny) (set! y ny))
                   (define/public (set-z nz) (set! z nz))

                   (define/public (get-x)
                     x)
                   (define/public (get-y)
                     y)
                   (define/public (get-z)
                     z)

                   ; takes in a constructor with 3 points (x, y, and z)
                   (init-field x y z)))

;; testing certain distance apart
(define p1 (make-object point% 9 3 6))
(define p2 (make-object point% -1 2 8))
(send p1 distance-range p2 11)
; #t

(define p3 (make-object point% 9 3 6))
(define p4 (make-object point% -1 2 8))
(send p3 distance-range p4 10)
; #f

;; testing distance
(define p5 (make-object point% 10 10 10))
(define p6 (make-object point% 11 11 11))
(send p5 distance p6)
; works

;; testing perimeter
(define p7 (make-object point% 1 8 2))
(define p8 (make-object point% 4 4 9))
(define p9 (make-object point% 9 5 2))

(printf "Distance of p7 to p8: ~a\n" (send p7 distance p8))
(printf "Distance of p7 to p9: ~a\n" (send p7 distance p9))
(printf "Distance of p8 to p9: ~a\n" (send p8 distance p9))

(printf "Perimeter of triangle: ~a\n" (send p7 triangle-perimeter p8 p9))
; works