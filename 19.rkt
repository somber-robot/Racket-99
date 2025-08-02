#lang racket
(require "17.rkt")

(define (rotate lst idx)
    (define split-idx (if (positive? idx)
                           idx
                           (- (length lst) (abs idx))))
    (let ((parts (split lst split-idx)))
        (append (list) (second parts) (first parts))))

(module+ main
    (rotate '(a b c d e f g h) 3)
    (rotate '(a b c d e f g h) -2))