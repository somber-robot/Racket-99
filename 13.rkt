#lang racket

(define (encode-direct lst)
    (define (++ n) (+ n 1))
    (define (loop clst val count final)
        (if (empty? clst)
            (if (zero? count)
                (append final (list val))
                (append final (list (list (++ count) val))))
            (let ((next (car clst))
                  (tail (cdr clst)))
                (if (eq? next val)
                    (loop tail val (++ count) final)
                    (if (zero? count)
                        (loop tail next 0 (append final (list val)))
                        (loop tail next 0 (append final (list (list (++ count) val)))))))))
    (loop (cdr lst) (car lst) 0 (list)))

(module+ main
    (encode-direct '(a a a a b c c a a d e e e e)))