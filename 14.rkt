#lang racket

(define (dupli lst)
    (define (loop clst result)
        (if (empty? clst)
            result
            (let ((value (car clst))
                  (tail (cdr clst)))
                (loop tail (append result (list value value))))))
    (loop lst (list)))

(module+ main
    (dupli '(a b c c d)))