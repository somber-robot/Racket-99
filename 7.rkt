#lang racket 

(define (my-flatten lst)
    (define (recur recur-lst)
        (define (loop loop-lst final)
            (if (empty? loop-lst)
                final
                (if (not (list? (first loop-lst)))
                    (loop (rest loop-lst) (append final (list (first loop-lst))))
                    (loop (rest loop-lst) (append final (recur (first loop-lst)))))))
        (loop recur-lst (list)))
    (recur lst))

(module+ main
    (my-flatten '(a (b (c d) e)))
    (my-flatten (list 1 2 (list 3 4) 5 '(6 (7 (8))) 9 (list 10)))
)