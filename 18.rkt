#lang racket

(define (slice lst start end)
    (define (++ n) (+ n 1))
    (define (loop clst i result)
        (if (> i end)
            result
            (let ((value (car clst))
                  (tail  (cdr clst)))
                (if (< i start)
                    (loop tail (++ i) result)
                    (loop tail (++ i) (append result (list value)))))))
    (loop lst 1 (list)))

(module+ main
    (slice '(a b c d e f g h i k) 3 7))