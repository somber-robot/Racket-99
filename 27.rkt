#lang racket
(require "26.rkt")

(define (group lst counts)
    (define (others lst items)
        (define (includes? lst elem)
            (define (loop clst)
                (if (empty? clst) 
                    #f
                    (let ((current (car clst)))
                        (if (eq? elem current) 
                            #t
                            (loop (cdr clst))))))
            (loop lst))
        (define (loop clst final)
            (if (empty? clst)
                final
                (let ((next (car clst))
                      (rem  (cdr clst)))
                    (loop rem (if (includes? items next)
                                  final
                                  (append final (list next)))))))
    (loop lst (list)))
    (define (outer bundles result)
        (define (inner head tail all)
            (if (empty? tail)
                all
                (let ((next (car tail))
                      (rem  (cdr tail)))
                    (inner head rem (append all (list (cons head next)))))))
        (if (empty? bundles)
            result
            (let ((head (car bundles))
                  (rem  (cdr bundles))
                  (tail (group (others lst (car bundles)) (cdr counts))))
                (outer rem (append result (inner head tail (list)))))))
    (if (= (length lst) (car counts))
        (list (list lst))
        (outer (combination (car counts) lst) (list))))


(module+ main
    (group '(a b c d e) '(1 3 1)))