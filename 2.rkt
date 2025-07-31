#lang racket

(define (my-but-last lst)
    (if (or (empty? lst) (empty? (cdr lst)))
        lst
        (let () (define (loop clst box)
                    (if (empty? clst)
                        box
                        (loop (cdr clst) (append (cdr box) (list (car clst))))))
                (loop lst (list null null)))))

(module+ main
    (my-but-last '(a b c d))
    (my-but-last (list 1 2 3 4))
    (my-but-last (list (+ 1 10) "5" exit void)))