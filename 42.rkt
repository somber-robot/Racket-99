#lang racket 
(require "40.rkt" sicp)

(define (goldbach-list a b L)
    (define (loop i)
        (if (> i b)
            (newline)
            (let ((nums (goldbach i)))
                (let ((x (first nums))
                      (y (second nums)))
                    (when (and (>= x L) (>= y L))
                        (display (format "~a = ~a + ~a\n" i x y))))
                (loop (+ i 2)))))
    (loop (if (even? a) a (+ a 1))))


(module+ main
    (goldbach-list 1 2000 50))