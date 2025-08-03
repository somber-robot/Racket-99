#lang racket

; a general combination of example (C 3 (A B C D E F))
; is equal to 
;   all 3 combinations starting with A of (A B C D E F)
; + all 3 combinations starting with B of (B C D E F)
; + all 3 combinations starting with C of (C D E F)
; + all 3 combinations starting with D of (D E F)
; ends when remaining pool is the size of count(3)(terminal case)

; each of those break down into:
; 3 comb w/ A of (A B C D E F)
; equals A + 
; all 2 combinations starting with B of (B C D E F)
; all 2 combinations starting with C of (C D E F)
; all 2 combinations starting with D of (D E F)
; all 2 combinations starting with E of (E F)
; ends when the remaining pool is the size of the new count(2)

; each of those break down into:
; 2 comb w/ B of (B C D E F)
; equals B +
; 1 combination starting with C = C
; 1 combination starting with D = D
; 1 combination starting with E = E
; 1 combination starting with F = F
; one combinations simply equal the first element of the list