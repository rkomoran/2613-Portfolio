#lang slideshow

(colorize (disk 40) "red")
(colorize (filled-rectangle 40 40) "red")
(disk 40)

(define (helper s1 myList)
  (if (empty? myList)
  '()
  (cons (colorize s1 (first myList)) (helper s1 (rest myList)))))


(helper (disk 40) '("red" "orange" "yellow" "green" "blue" "purple"))

;(define (my-rainbow2 shape)
  ;(let ([colors '("red" "orange" "yellow" "green" "blue" "purple")])
    ;(empty? colors) '()
    ;(cons (colorize shape (first colors)) (my-rainbow (colorize shape (first (rest colors)))))))

;;(define (my-rainbow s1)
  ;(my-rainbow-helper s1 '("red" "orange" "yellow" "green" "blue" "purple")))

