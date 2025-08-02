#lang racket

(define (repli lst count)
    (define (populate item)
        (define (iter i final)
            (if (= i count)
                final
                (iter (+ i 1) (append final (list item)))))
    (iter 0 (list)))
    (define (loop clst result)
        (if (empty? clst)
            result
            (let ((value (car clst))
                  (tail  (cdr clst)))
                (loop tail (append result (populate value))))))
    (loop lst (list)))

(module+ main
    (repli '(a b c) 2))