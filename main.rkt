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
  (define player-guess -1)
  (define game-over #false)

  (displayln "Welcome to the guessing game!")
  (displayln (format "I'm thinking of a number between ~a and ~a." min-number max-number))
  (displayln "Can you guess it?")

  (play-game-loop) ; Call the main game loop function
)

(define (play-game-loop) ; Main game loop function
  (loop play ([secret-number secret-number] [guess player-guess] [current-turn used-turns] [max-turns max-turns])
    (cond
        (begin
            (set! current-turn (+ current-turn 1))
        )
        [(> current-turn max-turns) (set! play #false)] ;; game-over because out of turns
        [(= secret-number guess) (set! play #false)] ;; game-over because you won
        [else ;;  still playing
            (begin
                (displayln "Please enter your guess between ~a and ~a:" min-number max-number)
                (handle-user-guess) ; Call the user input and guess checking function
            )
        ]
    )
  )
)

(define (handle-user-guess) ; User input and guess checking function
  (define user-guess (read))
  (if (> user-guess secret-number)
      (displayln "Your guess is too high!")
      (if (< user-guess secret-number)
          (displayln "Your guess is too low!")
          (begin
            (displayln "Congratulations! You guessed the number!")
            (set! game-over #true)
          )
      )
  )
  (if (= used-turns max-turns)
      (set! game-over #true)
      (set! used-turns (+ used-turns 1))
  )
)

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

(define (init-game msg))        ;; initialize the game state
(define (update-game msg))      ;; update the game state
(define (display-game msg))     ;; display the game state
(define (main)                  ;; run the game. States = initializing, updating, displaying, processing, and ending
  (run-guessing-game))

(main)