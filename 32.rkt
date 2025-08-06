#lang racket

(define (gcd x y)
    (if (zero? y)
        x
        (gcd y (remainder x y))))

(module+ main
    (gcd 36 63))