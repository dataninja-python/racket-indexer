#lang racket


(define (play-game)
    ;; this function does x
    displayln "Hi from the play-game function"
)

(define (init-game)
    ;; this function does x
    displayln "Hi from the init-game function"
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