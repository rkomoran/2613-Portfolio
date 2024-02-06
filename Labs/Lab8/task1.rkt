#lang racket

(define (palindrome string)
  ; (displayln string)
  (cond 
        [(> 2 (string-length string)) #t]
        ;(displayln (string-ref string 0))
        ;(displayln (string-ref string (sub1 (string-length string))))
        ;(displayln (substring string 1 (sub1 (string-length string))))
        
        [(char=? (string-ref string 0) (string-ref string (sub1 (string-length string))))
         (palindrome (substring string 1 (sub1 (string-length string))))]
        [else #f]))

(palindrome "ab")
