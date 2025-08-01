#lang racket

(define (++ n) (+ n 1))

(define (pack lst)
    (define (populate item count)
        (define (iter i container)
            (if (= i count)
                container
                (iter (++ i) (append container (list item)))))
        (list (iter 0 (list))))
    (define (loop clst val count final)
        (if (empty? clst)
            (append final (populate val (++ count)))
            (let ((next (car clst))
                  (tail (cdr clst)))
                (if (eq? next val)
                    (loop tail val (++ count) final)
                    (loop tail next 0 (append final (populate val (++ count))))))))
    (loop (cdr lst) (car lst) 0 (list)))


(module+ main
    (pack '(a a a a b c c a a d e e e e)))