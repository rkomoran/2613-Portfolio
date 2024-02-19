#lang racket

(define (palindrome sentence)
  (cond [(> 2 (string-length sentence))
         #t]
        [(char=? (string-ref sentence 0) (string-ref sentence (sub1 (string-length sentence))))
         (palindrome (substring sentence 1 (sub1 (string-length sentence))))]
        [else #f]))

(palindrome "cs2613")
(palindrome "racecar")
(palindrome "hannah")


(define (cipher word key pos)
  (cond [(= pos (string-length word))
         '()] ; Base case: If pos is equal to the length of the word, return an empty list
        [else
         (let* ([current-char (string-ref word pos)] ; Get the current character at position pos
               [encrypted-char (integer->char (+ (char->integer current-char) key))]) ; Encrypt the current character
           (cons encrypted-char (cipher word key (+ pos 1))))])) ; Recursively encrypt the rest of the word starting from the next position

(list->string (cipher "abcde" 8 0))
(list->string (cipher "secret message" 10 0))


(define (incrementAll myList)
  (if (empty? myList)
      '()
      (cons (+ 1 (first myList)) (incrementAll (rest myList)))))

(incrementAll '(1 2 3 4))

(define (keepEvenNumbers myList)
  (cond [(empty? myList)
         '()]
        [(odd? (first myList))
         (keepEvenNumbers (rest myList))]
        [(even? (first myList))
         (cons (first myList) (keepEvenNumbers (rest myList)))]))

(keepEvenNumbers '(1 2 3 4 5 6 7 8))

(define (reverse string)
  (cond [(= (string-length string) 0)
         '()]  ; Base case: If the length of the string is 0, return an empty list
        [else
         ; Cons the last character of the string with the reversed rest of the string
         (cons (string-ref string (- (string-length string) 1))
               (reverse (substring string 1 (- (string-length string) 1))))]))

; Test cases
(displayln (list->string (reverse "hello")))  ; Expected output: "olleh"
(displayln (list->string (reverse "racecar"))) ; Expected output: "racecar"
(displayln (list->string (reverse "")))        ; Expected output: ""