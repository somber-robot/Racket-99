#lang racket

(define (compress lst)
    (define (loop clst last-val result)
        (if (empty? clst)
            result
            (let  ((index-0 (first clst))
                   (rem (rest clst)))
                (if (eq? index-0 last-val)
                    (loop rem last-val result)
                    (loop rem index-0 (append result (list index-0)))))))
    (loop lst null (list)))

(module+ main
    (compress '(a a a a b c c a a d e e e e))
    (compress (list 1 2 2 1 1 1 1 3 4 3 3 3 4)))