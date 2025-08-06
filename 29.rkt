#lang racket 

(define (lfsort lst)
    (define len-data (make-hash))
    (define (first-loop clst)
        (if (empty? clst) 'end
            (let ((next (car clst))
                  (tail (cdr clst)))
                (if (equal? (hash-ref len-data (length next) 'null) 'null)
                    (hash-set! len-data (length next) (list next))
                    (hash-update! len-data (length next) (λ (lst) (append lst (list next)))))
                (first-loop tail))))
    (first-loop lst)
    (set! len-data (hash->list len-data))
    (define (comp l1 l2) (< (length (cdr l1)) (length (cdr l2))))
    (set! len-data (sort len-data comp))
    (define (second-loop clst result)
        (if (empty? clst)
            result
            (let ((next (car clst))
                  (tail (cdr clst)))
                (second-loop tail (append result (cdr next))))))
    (second-loop len-data (list)))


(module+ main
    (lfsort '((a b c) (d e) (f g h) (d e) (i j k l) (m n) (o))))