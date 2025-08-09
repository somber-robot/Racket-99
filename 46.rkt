#lang racket/load

(define (and x y) (if (eq? x 'true) y 'nil))
(define (or x y) (if (eq? x 'nil) y 'true))
(define (nand x y) (if (eq? (and x y) 'true) 'nil 'true))
(define (nor x y) (if (eq? (or x y) 'true) 'nil 'true))
(define (xor x y) (and (or x y) (nand x y)))
(define (impl x y) (if (eq? x 'true) y 'true))
(define (not x) (if (eq? x 'true) 'nil 'true))
(define equ eq?)

(define (fill v1 v2 a-val b-val expr)
    (regexp-replace* 
        (regexp (format "~a" v2)) 
        (regexp-replace* 
            (regexp (format "~a" v1)) 
            expr 
            a-val) 
        b-val))
(define (evaluate v1 v2 a b expr)
    (eval (read (open-input-string (fill v1 v2 (format "'~a" a) (format "'~a" b) (format "~a" expr))))))

(define (table v1 v2 expr)
    (display (format "  ~a  |   ~a  |  O  \n" v1 v2))
    (display "-------------------\n")
    (display (format "true | true | ~a\n"   (evaluate v1 v2 'true 'true expr)))
    (display (format "true | nil  | ~a\n"   (evaluate v1 v2 'true 'nil  expr)))
    (display (format "nil  | true | ~a\n"   (evaluate v1 v2 'nil  'true expr)))
    (display (format "nil  | nil  | ~a\n"   (evaluate v1 v2 'nil  'nil  expr)))
    (newline))



(table 'A 'B '(and A (or A B)))
(table 'x 'y '(or x (nand y y)))
(table '1 '2 '(xor 1 (impl 1 2)))
(table 'A 'B '(and A (or A (not B))))