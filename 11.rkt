#lang racket
(require "9.rkt")

(define (encode-modified lst)
    (define (loop clst final)
        (if (empty? clst)
            final
            (let ((count (length (car clst)))
                  (value (car (car clst)))
                  (tail (cdr clst)))
                (loop tail (append final (if (= count 1)
                                             (list value)
                                             (list (list count value))))))))
    (loop (pack lst) (list)))

(module+ main
    (encode-modified '(a a a a b c c a a d e e e e)))