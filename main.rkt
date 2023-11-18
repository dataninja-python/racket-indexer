#lang racket

(define upper 100)
(define lower 1)

;; @problem:
;; @problem:
;; @solution:
;; @input:
;; @output:
;; @details: main runs the guessing game
(define (guess)
    (quotient (+ lower upper) 2)
)

;; @problem:
;; @solution:
;; @input:
;; @output:
;; @details: main runs the guessing game
(define (smaller)
    ;; this function does x
    (set! upper (min lower (sub1 (guess)))) ;; expressions like this must be wrapped in () or risk issues
    (guess)
)

;; @problem:
;; @solution:
;; @input:
;; @output:
;; @details: main runs the guessing game
(define (bigger)
    ;; this function does x
    (set! lower (min upper (add1 (guess)))) ;; expressions like this must be wrapped in () or risk issues
    (guess)
)



;; @problem:
;; @solution:
;; @input:
;; @output:
;; @details: main runs the guessing game
(define (start-simple-game n m)
    (set! lower (min n m))
    (set! upper (max n m))
    (guess)
)

;; @problem:
;; @solution:
;; @input:
;; @output:
;; @details: main runs the guessing game
(define (main)

    (start-simple-game 1 100)
)

(main)