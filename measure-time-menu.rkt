#lang racket

(require racket/runtime)

(define (measure-execution-time function-to-measure . args)
  (let* ((start-time (current-inexact-milliseconds))
         (result (apply function-to-measure args))
         (end-time (current-inexact-milliseconds))
         (elapsed-time (- end-time start-time)))
    (values elapsed-time result)))

(define (example-function a b)
  ; Replace this with the code of the function you want to measure.
  (let loop ((i 0) (result 0))
    (if (< i a)
        (loop (+ i 1) (+ result b))
        result)))

(define (menu)
  (displayln "Menu:")
  (displayln "1. Measure execution time of example-function")
  (displayln "2. Exit")
  (let ((choice (read)))
    (case choice
      ((1)
       (displayln "Enter the value of a:")
       (define a (read))
       (displayln "Enter the value of b:")
       (define b (read))
       (define-values (elapsed-time result) (measure-execution-time example-function a b))
       (displayln (format "Execution time: ~a milliseconds" elapsed-time))
       (displayln (format "Result: ~a" result))
       (menu))
      ((2)
       (displayln "Goodbye!"))
      (else
       (displayln "Invalid choice. Please try again.")
       (menu)))))

(menu)