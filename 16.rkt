#lang racket

(define (drop lst idx)
    (define (++ n) (+ n 1))
    (define % remainder)
    (define (loop clst i result)
        (if (empty? clst)
            result
            (if (zero? (% i idx))
                (loop (cdr clst) (++ i) result)
                (loop (cdr clst) (++ i) (append result (list (car clst)))))))
    (loop lst 1 (list)))

(module+ main
    (drop '(a b c d e f g h i k) 3))