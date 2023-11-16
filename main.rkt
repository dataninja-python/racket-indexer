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
    (displayln (format "You have ~a turns left." turns))

;; get-guess gets a guess from the user
(define (get-guess)
    (get-user-input "What is your guess? "))

;; main function runs the program
(define (main)
  (run-guessing-game))

(main)