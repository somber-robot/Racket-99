#lang racket
(require "36.rkt")


(define (phi m)
    (define (-- n) (- n 1))
    (define (phi-part p m) (* (-- p) (expt p (-- m))))
    (define (loop lst result)
        (if (empty? lst)
            result
            (let ((p (car (car lst)))
                  (m (car (cdr (car lst))))
                  (tail (cdr lst)))
                (loop tail (* result (phi-part p m))))))
    (loop (prime-factors-mult m) 1))

(module+ main
    (phi 10)
    (phi 11)
    (phi 7))