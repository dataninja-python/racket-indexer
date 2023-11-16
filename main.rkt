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
(define used-turns 0)

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
    (guessing-game)))

;; guessing-game implements the guessing game logic
(define (guessing-game)
    (set! guess (get-guess)) ;; get a users guess
    (set! used-turns (+ used-turns 1)) ;; inrement the number of used turns
    (cond
        [(> used-turns turns) (displayln "You lose!")]
        [(= used-turns turns) (displayln "Last turn!")] ;; last turn
        [else (displayln "play game!")])
    (displayln (format "You have ~a turns left." turns)
    (guessing-game turns)))

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

#lang racket

(define (run-guessing-game)
  (define max-turns 3)
  (define min-number 1)
  (define max-number 100)
  (define secret-number (random (+ max-number 1)))
  (define used-turns 0)

  (displayln "Welcome to the guessing game!")
  (displayln (format "I'm thinking of a number between ~a and ~a." min-number max-number))
  (displayln "Can you guess it?")

  (let loop ((remaining-turns max-turns))
    (cond
      [(= used-turns max-turns) (displayln "Last turn!")]
      [(= used-turns (add1 max-turns)) (displayln "You lose!")]
      [else (display-turns remaining-turns)
            (let* ((guess (get-guess))
                   (used-turns (add1 used-turns)))
              (cond
                [(= guess secret-number) (displayln "Congratulations! You guessed it!")
                 (displayln (format "It took you ~a turns." used-turns))]
                [(> guess secret-number) (displayln "Too high!")]
                [else (displayln "Too low!")])
              (loop (sub1 remaining-turns)))])))

(define (get-guess)
  (get-user-input "What is your guess? "))

(define (get-user-input msg)
  (begin
    (display msg)
    (let ((user-input (read-line)))
      user-input)))

(define (display-turns remaining-turns)
  (displayln (format "You have ~a turns left." remaining-turns)))

(define (main)
  (run-guessing-game))

(main)
