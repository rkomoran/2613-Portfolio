#lang racket

;; Strings

(string-append "Hello " "world!")
; Hello world!

; Gets char at certain position
(string-ref "Hello" 0)
; #\H

; Can format strings with ~a
(printf "Here's a number: ~a\n" 51)
; Here's a number: 51

; Can make a string with repeated chars
(make-string 5 #\z)
; zzzzz

; Can also make a string with chars
; This provides a MUTABLE string
(string #\H #\I)
; HI

; Chars to integers
(char->integer #\A)
; 65

; Integers to chars
(integer->char 65)
; #\A

; Length of a string
(string-length "Hello")
; 5

; Changes char position in string to another char
; Must provide a MUTABLE string
(define s (string #\H #\e #\l #\l #\o))
(string-set! s 0 #\Y)
s
; Yello

;; Instead of using this to return a list of chars from a string
; Lists each character of string
(for/list ([i "Apple"])
  i)
; Output: '(#\A #\p #\p #\l #\e)

;; Use this instead
(string->list "Apple")
; Output: '(#\A #\p #\p #\l #\e)

;; Can use this to convert each char into string so it's nicer to look at
(map string (string->list "Apple"))
; Output: '("A" "p" "p" "l" "e")

; Can do reverse
(list->string '(#\A #\p #\p #\l #\e))

;; Make string uppercase
(string-upcase "Hello")
; HELLO

;; Same with lowercase
(string-downcase "HELLO")
; hello

(string-append* "a" "b" '("c" "d"))
; "abcd"

;; Advanced stuff

; The following uses * on the string-append & append* functions
; these do the same thing as the normal functions (append strings together & appending lists together)
; except that you can use arguments

; so map expects a #<procedure> & a list to be given. For our procedure -- we use lambda. This lambda NEEDS to have an argument for map
; the result of (map (lambda (x) (list ", " x)) '("Alpha" "Beta" "Gamma")) will be '((", " "Alpha") (", " "Beta") (", " "Gamma"))

; now, we want to append these lists into one list, append* does that for us
; (append* (map (lambda (x) (list ", " x)) '("Alpha" "Beta" "Gamma"))) gives us '(", " "Alpha" ", " "Beta" ", " "Gamma")

; string-append* turns this into a singular string
; ", Alpha ,Beta ,Gamma"

; and rest skips the first ", " from ", Alpha ,Beta ,Gamma" giving us "Alpha, Beta, Gamma"

(string-append* (rest (append* (map (lambda (x) (list ", " x)) '("Alpha" "Beta" "Gamma")))))

;; String join

; Appends strings but there is a seperator between each string (default whitespace)
; Note, does not add it to the last
(string-join '("one" "two" "three" "four"))
; "one two three four"

; Can also state which seperator to use
(string-join '("one" "two" "three" "four") " potato ")
; "one potato two potato three potato four"

;; String trimming

; trims a string by removing prefix and suffix seperators (whitespace, newlines, etc)
; default is whitespace
(string-trim "    woah \n look at this white space \t\r     ")
; "woah \n look at this white space"
; Note how the \n did not get removed -- only works on prefix/suffix of string

(string-trim "aahello thereaa" "aa")
; hello there

;; String splitting

; like string->list except this takes care of seperators at the suffix/prefix of string & provides strings instead of chars in the list

(string-split "   foo bar   baz \r\t\n")
; '("foo" "bar" "baz")


;; Local binding

; This will print "Bob" since me is bounded to bob
(let ([me "Bob"])
  "Alice"
  me)

; Here, let* will allow you to use previous bindings on future bindings
(let* ([x 1]
       [y (+ x 1)])  ; y = 1 + 1
  (* x y))

;; Lists

; linked-list data structures that end with '() to signify the end of the list

(cons 1 (cons 2 (cons 3 null)))

(cons "bob" (cons "jimmy" (cons "sandy" '())))

; Different ways to make a list

(list 1 2 3 4 5 6)

'(1 2 3 4 5 6)

; Can also append

(append '(1 2 3) '(4 5 6))
; '(1 2 3 4 5 6)

; Filtering

; Returns list of elements where #<procedure> produces a true value
(filter positive? '(1 -2 3 4 -5))
; '(1 3 4)

; Looks at each element and applies proc to each -- results list if proc returned true on element
(filter (lambda (number) (zero? (modulo number 2))) '(1 2 3 4 5 6))
; '(2 4 6)

;; Little bit of Map

; Map applies a funtion onto list(s)

(map add1 '(1 2 3 4))
; '(2 3 4 5)

; To do the following, the lists MUST be the same size
(map + '(1 2 3) '(10 11 12))
; '(11 13 15)

; andmap and ormap

; andmap applies #<procedure> to tail end of arguments
(andmap (lambda (number) (* 2 number)) '(1 2 3))
; 6

(andmap + '(1 2 3) '(4 5 6))
; 9

; checks if every element is positive
(andmap positive? '(1 -2 3))
; #f

; ormap applies #<procedure> to the first of arguments

(ormap sub1 '(1 2 3))
; 0

; only returns false if every element produces false
(ormap positive? '(1 -8 5))
; #t

;; Lambdas

; 'Lambda' is a function -- takes input & produces output

; This on it's own is just a #<procedure>
(lambda () "Hello World")

; Must use parens to call all functions -- including lambdas
((lambda () "Hello World"))
; "Hello World"

; You can assign this function to a variable
(define hello-world (lambda () "Hello World")) ; hello-world is now a variable that holds a #<procedure> -- must call it with parens
(hello-world)

; The () in lambda signifies the list of arguments for the function
; In ths case, it expects 1 argument and appends that argument
(define hello
  (lambda (name) (string-append "Hello ," name)))

; Above can be represented in the following way

(define (hello2 name)
  (string-append "Hello, " name))

; Lambda result
(hello "jimmy-bob")

; Sugared definition
(hello2 "timmy-bob")

; can have multi-variable functions as well

; Lambda approach

(define hello3
  (case-lambda
    [() "Hello World"]
    [(name) (string-append "Hello " name)]))

(hello3)
; Hello World

(hello3 "Bob")
; Hello Bob

; Here, note the lack of parens on lambda -- this function accepts any number of arguments
; and the arguments are bound to a list

(define count-args
  (lambda args
    (printf "You passed ~a args: ~a\n" (length args) args)))

(count-args 1 2 3 4)

;; Some iteration

; basic iteration -- iterates through an entire sequence
(for ([i 3])
  (displayln i))
; 0
; 1
; 2

; can also use range function
; can specify [start-pos] [end-pos] [iterate amount]
(for ([i (in-range 3)])
  (displayln i))
; 0
; 1
; 2

; list iteration example
(for ([i '(1 2 3)])
  (displayln i))

; Iteration that stores result in a list
; can preform calculations within for body

(for/list ([i '(1 2 3)])
  (* i i))

; Lists each character of string
(for/list ([i "abc"])
  i)

; in-naturals loop forever unless exception is made
; Parallel sequences and in-naturals work very well together. The expression stops iterating when any sequence ends

; this sets i = 1
(for ([i (in-naturals 1)]
      [chapter '("Intro" "Details" "Conclusion")])
  (printf "Chapter ~a. ~a\n" i chapter))


(for ([i (in-naturals)]
      [nums '(1 2 3 4)])
  (printf "Got ~a\n" nums))
