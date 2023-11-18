#lang racket

(define upper 100)
(define lower 1)
(define secret-number 77)
(define current-guess 0)

;; @problem:
;; @problem:
;; @solution:
;; @input:
;; @output:
;; @details: main runs the guessing game
(define (guess)
    (set! current-guess (quotient (+ lower upper) 2))
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
(define (run-game-loop)
    (loop
        (display "Is it ")
        (display current-guess)
        (display "?")
        (newline)
        (display "Type 's' for smaller, 'b' for bigger, 'y' for yes: ")
        (define response (read))
        (cond
            [(eq? response 's) (set! current-guess (smaller))]
            [(eq? response 'b) (set! current-guess (bigger))]
            [(eq? response 'y) (display "I win!")]
            [else (display "Invalid response. Try again.")]
        )
    (guess))
)

;; @problem:
;; @solution:
;; @input:
;; @output:
;; @details: main runs the guessing game
(define (start-simple-game n m)
    (set! lower (min n m))
    (set! upper (max n m))
    (run-game-loop)
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