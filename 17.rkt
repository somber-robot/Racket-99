#lang racket
(provide (all-defined-out))

(define (split lst idx)
    (define (++ n) (+ n 1))
    (define (loop clst i head tail)
        (if (empty? clst)
            (list head tail)
            (let ((next (car clst))
                  (rem  (cdr clst)))
                (if (<= i idx)
                    (loop rem (++ i) (append head (list next)) tail)
                    (loop rem (++ i) head (append tail (list next)))))))
    (loop lst 1 (list) (list)))

(module+ main
    (split '(a b c d e f g h i k) 3))