#lang racket

(provide totient-phi)

(define (totient-phi m)
    (define (++ n) (+ n 1))
    (define (loop i count)
        (if (= i m)
            count
            (if (= (gcd m i) 1)
                (loop (++ i) (++ count))
                (loop (++ i) count))))
    (if (= m 1)
        m
        (loop 1 0)))

(module+ main
    (totient-phi 10)
    (totient-phi 11)
    (totient-phi 7))