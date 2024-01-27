#lang racket
; reading in from file and converting numbers read from strings to numbers
(define (read-lines-from-file file-path)
  (with-input-from-file file-path
    
    ; anon function
    (lambda ()
      
      ; 3.9 Local Binding on racket docs
      ; can use a procedure inside body of let
      ; allows to be recursively called
      (let appender ([input '()]
                     [line (read-line)])
        (cond
          
          ; compares strings, if base case met
          ; just return the list
          [(string=? line "END") input]
          
          ; append needs to take in two lists as input
          ; this keeps adding strings to a list as they are read
          ; by read-line

          ; this checks if the string in the list is a number, if it is, turn it into a number and append it. If not, keep it and append it
                                                                                  ;if true              if false
          [else (appender (append input (list (if (number? (string->number line)) (string->number line) line)))
                                  (read-line))])))))

;(define (eqDefiner myList)
;  (cond
;    [(empty? myList) '()]
;    [(string=? (first myList) "END") '()]
;    [else
;     (let* ([word (first myList)])
;       (let* ([size ((second myList))])
;         (cond
;           [(string=? word "SUM") (handle-sum size (take-values (rest myList)))]
;           [(string=? word "AVG") (handle-avg size (take-values (rest myList)))]
;           [(string=? word "MAX") (handle-max size (take-values (rest myList)))]
;           [(string=? word "MIN") (handle-min size (take-values (rest myList)))]
;          [(string=? word "FXP") (handle-fxp size (take-values (rest myList)))]
;           [(string=? word "FPO") (handle-fpo size (take-values (rest myList)))]
;           [(string=? word "FSN") (handle-fsn size (take-values (rest myList)))]
;           [(string=? word "FCS") (handle-fcs size (take-values (rest myList)))]
;           [else '()])
;        (eqDefiner (drop-values (rest myList)))))]))

; test for just checking sum
(define (eqDefiner myList)
  (cond
    [(empty? myList) '()]
    [(string=? (first myList) "END") '()]
    [else
     (let* ([word (first myList)])
       (let* ([size (second myList)])
         (cond
           [(string=? word "SUM")
            ; skips indentifier
            (let ([result (handle-sum size (take-values (rest (rest myList))))])
              (displayln (cadr result)))]
           [else '()])
         (eqDefiner (drop-values (rest myList)))))]))

; this takes all the numbers after the initator up to a string
(define (take-values lst)
  (cond
    [(empty? lst) '()]
    [(string? (first lst)) '()]
    [else (cons (first lst) (take-values (rest lst)))]))

; this will only return the first string encounter, if a number is met -- it'll keep
; recursing until a string is found
(define (drop-values lst)
  (cond
    [(empty? lst) '()]
    [(string? (first lst)) lst]
    [else (drop-values (rest lst))]))


;(define (handle-sum size values)
;  )

;(define (handle-avg size values)
;  )

;(define (handle-max size values)
;  )

;(define (handle-min size values)
;  )

;(define (handle-fxp size values)
;  )

;(define (handle-fpo size values)
;  )

;(define (handle-fsn size values)
;  )

;(define (handle-fcs size values)
;  )

(define (process-file file)
  (eqDefiner (read-lines-from-file file)))

(define input-file "DataInput.txt")
(define results (process-file input-file))


;(read-lines-from-file "DataInput.txt")
              
;(define lines (read-lines-from-file "DataInput.txt"))
;(displayln lines)