#lang racket 

(define (decode lst)
    (define (++ n) (+ n 1))
    (define (populate val count)
        (define (iter i final)
            (if (= i count)
                final
                (iter (++ i) (append final (list val)))))
        (iter 0 (list)))
    (define (loop clst result)
        (if (empty? clst)
            result
            (let ((next (car clst))
                  (tail (cdr clst)))
                (if (list? next)
                    (loop tail (append result (populate (second next) (car next))))
                    (loop tail (append result (list next)))))))
    (loop lst (list)))

(module+ main
    (decode '((4 A) B (2 C) (2 A) D (4 E))))