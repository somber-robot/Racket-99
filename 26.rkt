#lang racket

(define (combination count lst)
    (define (-- n) (- n 1))
    (define (bundle lst)
        (define (loop clst final)
            (if (empty? clst)
                final
                (let ((value-lst (list (car clst)))
                      (tail (cdr clst)))
                    (loop tail (append final (list value-lst))))))
        (loop lst (list)))
    (define (outer clst result)
        (define (inner head tail all)
            (if (empty? tail)
                all
                (let ((next (car tail))
                      (rem  (cdr tail)))
                    (inner head rem (append all (list (cons head next)))))))
        (if (empty? clst)
            result
            (let ((head (car clst))
                  (rem  (cdr clst))
                  (tail (combination (-- count) (cdr clst))))
                (outer rem (append result (inner head tail (list)))))))
    (if (= count 1)
        (bundle lst)
        (outer lst (list))))

(module+ main
    (combination 3 '(a b c d e f)))