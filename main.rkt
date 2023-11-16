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
  (define lost-game #f)

  (displayln "Welcome to the guessing game!")
  (displayln (format "I'm thinking of a number between ~a and ~a." min-number max-number))
  (displayln "Can you guess it?")

  (let loop ((remaining-turns max-turns))
    (cond
      [(= used-turns max-turns) (displayln "Last turn!")] ;; if used = max, this is last turn
      [(> used-turns max-turns) (begin
        (displayln "You lose!")
        (break))] ;; if used > max, you lose
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
