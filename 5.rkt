#lang racket 

(define (reverse-list lst)
    (define (insert-at-front lst item)
        (append (list item) lst))
    (define (loop clst rev)
        (if (empty? clst)
            rev
            (loop (cdr clst) (insert-at-front rev (car clst)))))
    (loop lst (list)))

(module+ main
    (reverse-list (list 1 2 3))
    (reverse-list '(a b c d e))
    (reverse-list (list)))