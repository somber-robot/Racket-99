#lang racket
(require "22.rkt" "23.rkt")

(define (lotto-select count max)
    (rnd-select (range 1 max) count))

(module+ main
    (lotto-select 6 49))