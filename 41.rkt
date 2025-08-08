#lang racket
(require "40.rkt")

(define (goldbach-list a b)
    (define (loop i)
        (if (> i b)
            (newline)
            (let ((nums (goldbach i)))
                (display (format "~a = ~a + ~a\n" i (car nums) (car (cdr nums))))
                (loop (+ i 2)))))
    (loop (if (even? a) a (+ a 1))))

(module+ main
    (goldbach-list 9 20))