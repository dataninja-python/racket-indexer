#lang racket

;;(require racket/runtime)

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

(define-values (elapsed-time result) (measure-execution-time example-function 1000000 2))

(displayln (format "Execution time: ~a milliseconds" elapsed-time))
(displayln (format "Result: ~a" result))
