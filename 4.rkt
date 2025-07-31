#lang racket

(define (size-of lst)
    (define (loop clst count)
        (if (empty? clst)
            count
            (loop (cdr clst) (+ count 1))))
    (loop lst 0))

(module+ main
    (size-of (list 1 2 3 4))
    (size-of '(a b c))
    (size-of (list)))