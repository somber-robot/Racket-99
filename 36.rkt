#lang racket
(require "10.rkt")
(require "35.rkt")

(provide prime-factors-mult)

(define (prime-factors-mult N)
    (define (reverse-pairs clst final)
        (if (empty? clst)
            final
            (let ((idx-0 (car (car clst)))
                  (idx-1 (car (cdr (car clst))))
                  (tail (cdr clst)))
                (reverse-pairs tail (append final (list (list idx-1 idx-0)))))))
    (reverse-pairs (encode (prime-factors N)) (list)))


(module+ main
    (prime-factors-mult 315))