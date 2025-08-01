#lang racket

(define (++ n) (+ n 1))

(define (encode lst)
    (define (loop clst val count final)
        (if (empty? clst)
            (append final (list (list (++ count) val)))
            (let ((next (car clst))
                  (tail (cdr clst)))
                (if (eq? next val)
                    (loop tail val (++ count) final)
                    (loop tail next 0 (append final (list (list (++ count) val))))))))
    (loop (cdr lst) (car lst) 0 (list)))

(module+ main
    (encode '(a a a a b c c a a d e e e e)))