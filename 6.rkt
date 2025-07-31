#lang racket 

(define (palindrome? lst)
    (let ((len (length lst)))
         (define (loop i)
            (if (>= i len) #t
                (if (not (eq? (list-ref lst i) (list-ref lst (- len i 1))))
                    #f
                    (loop (+ i 1))))) 
        (loop 0)))

(module+ main
    (palindrome? (list 1 2 3))
    (palindrome? '(a b b a))
    (palindrome? (list "a" "b" "a" "b"))
    (palindrome? '(x a m a x)))