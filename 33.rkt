#lang racket

(define (coprime a b)
    (define (gcd x y) (if (zero? y) x (gcd y (remainder x y))))
    (= (gcd a b) 1))

(module+ main
    (coprime 35 64)
    (coprime 7 14))