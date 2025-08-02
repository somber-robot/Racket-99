#lang racket

(provide (all-defined-out))

(define (range start end)
    (define delta (if (< start end) 1 -1))
    (define (loop i result)
        (if (= i end)
            (append result (list i))
            (loop (+ i delta) (append result (list i)))))
    (loop start (list)))

(module+ main
    (range 4 9)
    (range 10 5))