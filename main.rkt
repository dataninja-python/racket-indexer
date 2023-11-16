#lang racket

(define (play-game)
    ;; this function does x
    (displayln "Hi from the play-game function") ;; expressions like this must be wrapped in () or risk issues
)

(define (init-game)
    ;; this function does x
    (displayln "Hi from the init-game function") ;; see comment from play-game
)

;; @problem:
;; @solution:
;; @input:
;; @output:
;; @details: main runs the guessing game
(define (main)
    (init-game)
    (play-game)
)

(main)