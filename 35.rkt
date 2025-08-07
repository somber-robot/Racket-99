#lang racket

(define (prime? x found-primes)
    (define (prime-loop clst last)
        (if (empty? clst)
            last
            (let ((next (car clst))
                  (tail (cdr clst)))
                (if (and (not (= x next)) (zero? (remainder x next)))
                    #false
                    (prime-loop tail next)))))
    (define (main-loop i)
        (if (>= (sqr i) x)
            #true
            (if (zero? (remainder x i))
                #false
                (main-loop (+ i 1)))))
    (define (next x) (if (even? x) (+ x 1) (+ x 2)))
    (let ((value (prime-loop found-primes 2)))
        (if (not value)
            value
            (main-loop (next value)))))

(define (prime-factors N)
    (define (++ n) (+ n 1))
    (define (loop n i primes-found factors)
        (if (= n 1)
            factors
            (if (prime? i primes-found)
                (if (zero? (remainder n i))
                    (loop (/ n i) i (append primes-found (list i)) (append factors (list i)))
                    (loop n (++ i) (append primes-found (list i)) factors))
                (loop n (++ i) primes-found factors))))
    (loop N 2 (list) (list)))

(module+ main
    (prime-factors 9)
    (prime-factors 315)
    (prime-factors 500))