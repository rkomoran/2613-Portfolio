;Add comments to the code to identify errors.
;There are 6 errors in total for full points, clearly identify all of them.
;You are not required to correct the code, but you may find that correcting it will help you find errors.

;Should be racket
#lang rkt


(define (decipher word key pos)
  ; - pos 1 should not be used for a comparision -- should just be pos
  (cond [(not(>= (string-length word) (- pos 1)))
         (cons (integer->char (- key (char->integer(string-ref word pos))))
               ; add1 should not be used
               ; sub1 needs to be used on pos and not key
               (decipher word (add1 key) pos))
         ]
        ; this is returning some char but what char is not determined
        [else #\ ]
  )
)

; missing a bracket, should be (list->string (decipher ("Phvvdjh" 3 0))
(list->string decipher ("Phvvdjh" 3 0))