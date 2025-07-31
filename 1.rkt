#lang racket

(define (my-last lst)
    (define (loop clst last)
        (if (empty? clst)
            (list last)
            (loop (cdr clst) (car clst))))
    (loop lst null))

(module+ main
    (my-last '(a b c d))
    (my-last (list 1 2 3 4))
    (my-last (list (+ 1 10) "5" exit void)))