#lang racket

;; requirements to run the program
(require racket/cmdline
         racket/format
         racket/path
         racket/list)

;; @problem:
;; @solution:
;; @input:
;; @output:
;; @details:
;; run-guessing-game runs the guessing game
(define (run-guessing-game)
  (define max-turns 3)
  (define min-number 1)
  (define max-number 100)
  (define secret-number (random (+ max-number 1)))
  (define used-turns 0)
  (define game-over #f)

  (displayln "Welcome to the guessing game!")
  (displayln (format "I'm thinking of a number between ~a and ~a." min-number max-number))
  (displayln "Can you guess it?")

  (loop
    (if (game-over)
        (break)
        (displayln "play game" [(set! used-turns (+ used-turns 1))] [(> used-turns 2) (set! game-over #t)])))
        )))


(define (get-guess)
  (get-user-input-as-number "What is your guess? "))

#|
(define (get-user-input msg)
  (begin
    (display msg)
    (let ((user-input (read-line)))
      user-input)))
|#

(define (get-user-input-as-number prompt)
  (let ((input (get-user-input prompt)))
    (string->number input)))

(define (get-user-input prompt)
  (display prompt)
  (flush-output)
  (read-line))

(define (display-turns remaining-turns)
  (displayln (format "You have ~a turns left." remaining-turns)))

(define (invert-boolean a-boolean)
  (cond
    [(boolean? a-boolean) (not a-boolean)]
    [(not boolean? a-boolean) (#f)]
    [else (error "urgent: reaching this branch of logic after dealing with known errors." a-boolean)]))

(define (main)
  (run-guessing-game))

(main)


