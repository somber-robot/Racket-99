#lang racket
(provide (all-defined-out))

(define (remove-at lst idx)
    (define (++ n) (+ n 1))
    (define (loop clst i result)
        (if (empty? clst)
            result
            (if (= i idx)
                (loop (cdr clst) (++ i) result)
                (loop (cdr clst) (++ i) (append result (list (car clst)))))))
    (loop lst 1 (list)))

(module+ main
    (remove-at '(a b c d) 2))