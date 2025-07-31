#lang racket

(define (element-at lst idx)
    (define (not-valid-index? i)
        (or (not (number? i)) 
            (not (= (floor i) i))
            (not (> i 0))))
    (define (loop clst count)
        (if (or (empty? clst) (not-valid-index? idx))
            'null
            (if (= count idx)
                (car clst)
                (loop (cdr clst) (+ count 1)))))
    (loop lst 1))

(module+ main
    (element-at '(a b c d e) -1)
    (element-at '(a b c d e) 4)
    (element-at '(a b c d e) 1))