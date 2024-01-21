#lang slideshow

(define (rainbow-helper count s1 s2 myList)
  (cond [(empty? myList)
         '()]
        [(even? count)
         (cons (colorize s1 (first myList)) (rainbow-helper (sub1 count) s1 s2 (rest myList)))]
        [else
         (cons (colorize s2 (first myList)) (rainbow-helper (sub1 count) s1 s2 (rest myList)))]))

(define (my-rainbow s1 s2)
  (let* ([colors (list "red" "orange" "yellow" "green" "blue" "purple")]
        [size (length colors)])
    (rainbow-helper size s1 s2 colors)))

(my-rainbow (filled-rectangle 25 25) (filled-ellipse 25 25))
