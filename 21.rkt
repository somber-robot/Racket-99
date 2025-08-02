#lang racket

(define (insert-at item lst idx)
    (define (++ n) (+ n 1))
    (define (loop clst i result)
        (if (empty? clst)
            result
            (let ((tail  (if (= i idx) clst (cdr clst)))
                  (value (if (= i idx) item (car clst))))
                (loop tail (++ i) (append result (list value))))))
    (loop lst 1 (list)))

(module+ main
    (insert-at 'alfa '(a b c d) 2)) 