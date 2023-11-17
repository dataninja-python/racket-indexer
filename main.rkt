#lang racket

(define upper 100)
(define lower 1)

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
(define (end-game)
    ;; this function does x
    (displayln "Hi from the end-game function") ;; expressions like this must be wrapped in () or risk issues
)

;; @problem:
;; @solution:
;; @input:
;; @output:
;; @details: main runs the guessing game
(define (play-game)
    ;; this function does x
    (displayln "Hi from the play-game function") ;; expressions like this must be wrapped in () or risk issues
    (end-game)
)

;; @problem:
;; @solution:
;; @input:
;; @output:
;; @details: main runs the guessing game
(define (init-game)
    ;; this function does x
    (displayln "Hi from the init-game function") ;; see comment from play-game
    (displayln "Step 1: create the data structure for the game") ;; see comment from play-game
    (define game-state-list (list 'initializing 'playing 'ending))
    (define  (format "The game states are: " game-state-list))
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
    (init-game)
    (play-game)
    (start-simple-game 1 100)
)

(main)