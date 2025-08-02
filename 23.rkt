#lang racket
(require "20.rkt")

(provide (all-defined-out))

(define (rnd-select lst count)
    (define (loop clst)
        (let ((len (length clst)))
            (if (= len count)
                clst
                (loop (remove-at clst (+ (random len) 1))))))
    (loop lst))

(module+ main
    (rnd-select '(a b c d e f g h) 4))