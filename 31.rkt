#lang racket

(define (is-prime? num)
    (define (iter i)
        (if (>= (sqr i) num)
            #true
            (if (= (remainder num i) 0)
                #false
                (iter (+ i 1)))))
    (iter 2))

(module+ main
    (is-prime? 10)
    (is-prime? 2)
    (is-prime? 3)
    (is-prime? 15)
    (is-prime? 7))