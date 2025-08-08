#lang racket
(require "31.rkt")

(provide goldbach)

(define (goldbach N)
    (define (next x) (if (even? x) (+ x 1) (+ x 2)))
    (define (loop i)
        (if (is-prime? i)
            (if (is-prime? (- N i))
                (list i (- N i))
                (loop (next i)))
            (loop (next i))))
    (loop 2))

(module+ main
    (goldbach 28)
    (goldbach 120))