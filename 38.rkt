#lang racket
(require "34.rkt" "37.rkt" sicp)

(define (time-test name proc)
    (define start (runtime))
    (proc 10090)
    (display (format "~a test: ~a ms" name (- (runtime) start)))
    (newline))

(module+ main
    (time-test 'P34 totient-phi)
    (time-test 'P37 phi))