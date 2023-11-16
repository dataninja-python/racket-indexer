#lang racket

(require racket/cmdline
         racket/format
         racket/path
         racket/list)

;; set global variables
(define turns 3)
(define minimum-number 1)
(define maximum-number 100)
(define secret-number 50)
(define guess -1)
(define message "Hello World")

;; set global helper functions

;; get-user-input gets user input
(define (get-user-input msg)
    (begin
        (display msg) ;; display a prompt
        ;;(flush-output-port) ;; display the propt immediately
        (let ((user-input (read-line)))
            user-input)))

;; run-guess-game runs the guessing game
(define (run-guessing-game)
  (begin
    (displayln "Welcome to the guessing game!")
    (displayln (format "I'm thinking of a number between ~a and ~a." minimum-number maximum-number))
    (displayln "Can you guess it?")
    (displayln (format "You have ~a turns to guess." turns))
    (guessing-game turns)))

;; guessing-game implements the guessing game logic
(define (guessing-game N)
    (set! guess (get-guess)) ;; get a users guess
    (set! turns (- N 1)) ;; decrement the number of turns
    (cond
        [(< turns 0) (displayln "You lose!")]
        [(= turns 0) (displayln "Last turn!")] ;; last turn
        [else (displayln "play game!")]
    (displayln (format "You have ~a turns left." turns))))

;; get-guess gets a guess from the user
(define (get-guess)
    (get-user-input "What is your guess? "))

;; display-turns shows user the number of guesses remaining
(define (display-turns N)
    (displayln (format "You have ~a turns left." N)))

;; main function runs the program
(define (main)
  (run-guessing-game))

(main)