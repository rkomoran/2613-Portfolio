#lang slideshow

(colorize (disk 40) "red")
(colorize (filled-rectangle 40 40) "red")
(disk 40)

(define (my-rainbow shape)
  (let ([colors '("red" "orange" "yellow" "green" "blue" "purple")])
    (empty? colors) '()
    (cons (colorize shape (first colors)) (my-rainbow (colorize shape (first (rest colors)))))))




  
