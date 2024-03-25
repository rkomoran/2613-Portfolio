#lang racket

(require racket/draw)

(define target (make-bitmap 300 300)) ; A 300x300 bitmap
(define dc (new bitmap-dc% [bitmap target]))

;; setting colours
; set colour for background
(define background-brush (new brush% [color (make-color 255 210 0)]))
; set colour for froggo
(define froggo-brush (new brush% [color (make-color 0 198 0)]))

;; background
; need to set to the orange colour
(send dc set-brush background-brush)
(send dc draw-rectangle
      0 0
      300 300)

;; draws the shape of froggo
(define (draw-body dc)
  ; no outline
  (send dc set-pen "white" 1 'transparent)
  ; set smoothing
  (send dc set-smoothing 'smoothed)

  ; body of froggo
  (send dc set-brush froggo-brush)
  (send dc draw-ellipse
        6 170
        290 290)

  ; eyes of froggo
  (send dc draw-ellipse
        47 140
        75 75)

  (send dc draw-ellipse
        185 140
        75 75))

;; draws the back outlining of froggo
(define (draw-outline dc)
  ; no outline
  (send dc set-pen "white" 1 'transparent)
  ; set smoothing
  (send dc set-smoothing 'smoothed)

  ; body of froggo
  (send dc set-brush "black" 'solid)
  (send dc draw-ellipse
        3.3 165
        296 296)

  ; eyes of froggo
  (send dc draw-ellipse
        43.5 136
        83 83)

  (send dc draw-ellipse
        181.5 136
        83 83))

;; draws mouth of froggo
(define (draw-mouth dc)
  (send dc scale 0.9 0.9)
  (send dc set-brush "black" 'solid)
  (send dc draw-arc 128 160 80 80 (* 5/4 pi) (* 7/4 pi))
  (send dc set-brush froggo-brush)
  (send dc draw-arc 128 155 80 80 (* 5/4 pi) (* 7/4 pi)))

;; similar code for eyes
#|
(define (draw-hands dc)
  (send dc set-brush "black" 'solid)
  (send dc draw-ellipse
        60 190
        40 40))
|#

;; draws hands of froggo
(define (draw-hands dc)
  ; left arm
  (send dc set-brush "black" 'solid)
  (send dc draw-ellipse
        50 230
        45 80)
  (send dc set-brush froggo-brush)
  (send dc draw-ellipse
        48 229
        49 72)
  ; right arm
  (send dc set-brush "black" 'solid)
  (send dc draw-ellipse
        244 230
        45 80)
  (send dc set-brush froggo-brush)
  (send dc draw-ellipse
        242 229
        49 72))

;; froggo's eyes
(define (draw-eyes dc)
  ; left eye
  (send dc set-brush "black" 'solid)
  (send dc draw-ellipse
        78 170
        30 30)
  ; right eye
  (send dc set-brush "black" 'solid)
  (send dc draw-ellipse
        235 170
        30 30))

(define (draw-text dc)
  (send dc set-font (make-font #:size 54 #:family 'decorative #:weight 'bold))
  (send dc set-text-foreground "black")
  (send dc draw-text "Frog" 91 41)
  (send dc set-text-foreground "red")
  (send dc draw-text "Frog" 90 40))



(define (make-froggo)
  (draw-outline dc)
  (draw-body dc)
  (draw-mouth dc)
  (draw-hands dc)
  (draw-eyes dc)
  (draw-text dc))

(make-froggo)
(send target save-file "froggo.png" 'png)