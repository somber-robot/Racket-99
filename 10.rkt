#lang racket
(require "9.rkt")

(provide (all-defined-out))

(define (encode lst)
    (define (loop clst final)
        (if (empty? clst)
            final
            (let ((count (length (car clst)))
                  (value (car (car clst)))
                  (tail (cdr clst)))
                (loop tail (append final (list (list count value)))))))
    (loop (pack lst) (list)))

(module+ main
    (encode '(a a a a b c c a a d e e e e)))