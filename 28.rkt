#lang racket

(define (lsort lst)
    (define data (make-hash))
    (define (first-loop clst)
        (if (empty? clst) 'end
            (let ((next (car clst))
                  (tail (cdr clst)))
                (if (equal? (hash-ref data (length next) 'null) 'null)
                    (hash-set! data (length next) (list next))
                    (hash-update! data (length next) (λ (lst) (append lst (list next)))))
                (first-loop tail))))
    (first-loop lst)
    (define lengths (hash-keys data))
    (define (second-loop len-lst result)
        (if (empty? len-lst)
            result
            (let ((tail  (cdr len-lst))
                  (items (hash-ref data (car len-lst))))
                (second-loop tail (append result items)))))
    (second-loop lengths (list)))

(module+ main
    (lsort '((a b c) (d e) (f g h) (d e) (i j k l) (m n) (o))))