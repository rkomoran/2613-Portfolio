#lang racket
; (lambda (i) (integer->char (+ i 97))))

#|
(define (cipher string key start)
  (let loop ([charString (string->list string)]
             [storedVal '()])
    (if (empty? charString)
        storedVal
        (loop (rest charString) (cons (integer->char (+ key 97)) storedVal)))))
|#

(define (cipher string key start)
  (for/list ([i string])
    (integer->char(+ key (char->integer i)))))
    


(list->string (cipher "Message" 3 0))
(list->string (cipher "UPPERCASE" 26 0))
(list->string (cipher "123456" -4 0))
