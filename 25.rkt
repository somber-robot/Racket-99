#lang racket
(require "20.rkt")

(define (rnd-permu lst)
    (define (value-at vlst idx)
        (define (loop clst i)
            (if (= i idx)
                (car clst)
                (loop (cdr clst) (+ i 1))))
        (list (loop vlst 1)))
    (define (loop clst result)
        (if (empty? clst)
            result
            (let ((rnd-idx (+ (random (length clst)) 1)))
                (loop (remove-at clst rnd-idx)
                      (append result (value-at clst rnd-idx))))))
    (loop lst (list)))

(module+ main
    (rnd-permu '(a b c d e f)))