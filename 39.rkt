#lang racket

(define (primes a b)
    (define (prime? n)
        (define (loop i)
            (if (> (sqr i) n)
                #true
                (if (zero? (remainder n i))
                    #false
                    (loop (+ i 1)))))
    (loop 2))
    (define (next n) (if (even? n) (+ n 1) (+ n 2)))
    (define (loop i final)
        (if (> i b)
            final
            (if (prime? i)
                (loop (next i) (append final (list i)))
                (loop (next i) final))))
    (loop a (list)))

(module+ main
    (primes 2 10)
    (primes 20 40)) 