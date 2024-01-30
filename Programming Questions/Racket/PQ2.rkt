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

(define (eqDefiner myList)
  (cond
    [(empty? myList) '()]
    [(string=? (first myList) "END") '()]
    [else
     (let* ([word (first myList)])
       (let* ([size (second myList)])
         (cond
           [(string=? word "SUM") (displayln (handle-sum (take-values (rest (rest myList)))))] 
           [(string=? word "AVG") (displayln (handle-avg size (take-values (rest (rest myList)))))]
           [(string=? word "MAX") (displayln (handle-max size (take-values (rest (rest myList))) -inf.0))]
           [(string=? word "MIN") (displayln (handle-min size (take-values (rest (rest myList))) +inf.0))]
           [(string=? word "FXP") (displayln (handle-fxp (take-values (rest (rest myList)))))]
           [(string=? word "FPO") (displayln (handle-fpo (take-values (rest (rest myList)))))]
           [(string=? word "FSN") (displayln (handle-fsn (take-values (rest (rest myList)))))]
           [(string=? word "FCS") (displayln (handle-fcs (take-values (rest (rest myList)))))]
           [else '()])
        (eqDefiner (drop-values (rest myList)))))]))

#|
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
            ; Call handle-sum and print the result directly
            (displayln (handle-sum size (take-values (rest (rest myList)))))]
           [else '()])
         (eqDefiner (drop-values (rest myList)))))]))
|#

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

; calculates sum
(define (handle-sum values)
  (cond
    [(empty? values) 0] 
    [else (+ (first values) (handle-sum (rest values)))]))

; calculates average 
(define (handle-avg size values)
  (/ (handle-sum values) size))

; finds max in list
(define (handle-max size values maxVal)
  (cond
    [(empty? values) maxVal] 
    [else
     (cond
       [(> (first values) maxVal) (handle-max size (rest values) (first values))]
       [else (handle-max size (rest values) maxVal)])]))

; finds min in list
(define (handle-min size values minVal)
    (cond
    [(empty? values) minVal] 
    [else
     (cond
       [(< (first values) minVal) (handle-min size (rest values) (first values))]
       [else (handle-min size (rest values) minVal)])]))

(define (factorial n)
  (cond
    [(<= n 0) 1]
    [(* n (factorial (sub1 n)))]))

(define (handle-fxp values)
  (define (compute-fxp z)
    (let loop ([k 0]
               [currListNums '()])
      (if (= k 50)
          ; when 50 is reached, add the current list all together into 1 number
          (handle-sum currListNums)
          ; if not, keep recursive calling our let and updating k
          ; as well as appending calculations to currListNums list
          (loop (add1 k)
                (cons (/ (expt z k) (factorial k))
                      currListNums)))))
  
  ; applies the compute-fxp function on each element in list
  ; and map returns a new list of each number interation calculated by
  ; compute-fxp
  (map compute-fxp values))

(define (handle-fpo values)
  (define (compute-fpo z)
    (let loop ([k 0]
               [currListNums '()])
      (if (= k 50)
          (handle-sum currListNums)
          (loop (add1 k) (cons (* k (/ (expt z k) (factorial k))) currListNums)))))
  
  (map compute-fpo values))

(define (handle-fsn values)
  (define (compute-fsn z)
    (let loop ([k 0]
               [currListNums '()])
      (if (= k 50)
          (handle-sum currListNums)
          (loop (add1 k)
                (cons (/ (* (expt -1 k) (expt z (+ 1 (* 2 k)))) (factorial (+ 1 (* 2 k))))
                      currListNums)))))
  
  (map compute-fsn values))

(define (handle-fcs values)
  (define (compute-fcs z)
    (let loop ([k 0]
               [currListNums '()])
      (if (= k 50)
          (handle-sum currListNums)
          (loop (add1 k) (cons (/ (* (expt -1 k) (expt z (* 2 k))) (factorial (* 2 k))) currListNums)))))
  
  (map compute-fcs values))


(define (process-file file)
  (eqDefiner (read-lines-from-file file)))

(define input-file "DataInput.txt")
(define results (process-file input-file))


;(read-lines-from-file "DataInput.txt")
              
;(define lines (read-lines-from-file "DataInput.txt"))
;(displayln lines)
