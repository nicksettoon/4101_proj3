(load "./s48.scm")
(load "./done.scm")

;; defines for binaries testing
(define pn-pd-rat (rational 9 2))
(define pn-nd-rat (rational 9 -2))
(define nn-pd-rat (rational -9 2))
(define nn-nd-rat (rational -9 -2))

(define pn-pd-rat2 (rational 18 4))
(define pn-nd-rat2 (rational 18 -4))
(define nn-pd-rat2 (rational -18 4))
(define nn-nd-rat2 (rational -18 -4))

(define pn-pd-int (rational 8 2))
(define pn-nd-int (rational 8 -2))
(define nn-pd-int (rational -8 2))
(define nn-nd-int (rational -8 -2))

(define pn-pd-int2 (rational 16 4))
(define pn-nd-int2 (rational 16 -4))
(define nn-pd-int2 (rational -16 4))
(define nn-nd-int2 (rational -16 -4))

(define neg-rat pn-nd-rat)
(define neg-rat2 pn-nd-rat2)
(define neg-int pn-nd-int)
(define neg-int2 pn-nd-int2)

(define pos-rat pn-pd-rat)
(define pos-rat2 pn-pd-rat2)
(define pos-int pn-pd-int)
(define pos-int2 pn-pd-int2)

(define x 4)
;; int-int
;(b+ 1 2)
;; int-rat
(b= (b+ x neg-rat))
(b= (b+ x neg-rat2))
(b= (b+ x neg-int))
(b= (b+ x neg-int2))
; rat-int
;(b= (b+ (rational 2 3) 8))
;(b= (b+ (rational -2 3) 8))
;(b= (b+ (rational 2 -3) 8))
;(b= (b+ (rational -2 -3) 8))
;
;; rat-rat
;    ; diff denom, rat1
;    (b= (b+ (rational 1 2) (rational 4 5)))
;    (b= (b+ (rational -1 2) (rational 4 5)))
;    (b= (b+ (rational 1 -2) (rational 4 5)))
;    (b= (b+ (rational -1 -2) (rational 4 5)))
;    ; diff denom, rat2
;    (b= (b+ (rational 1 2) (rational 4 5)))
;    (b= (b+ (rational 1 2) (rational -4 5)))
;    (b= (b+ (rational 1 2) (rational 4 -5)))
;    (b= (b+ (rational 1 2) (rational -4 -5)))
;    ; same denom, rat1
;    (b= (b+ (rational 5 3) (rational 5 3)))
;    (b= (b+ (rational -5 3) (rational 5 3)))
;    (b= (b+ (rational 5 -3) (rational 5 3)))
;    (b= (b+ (rational -5 -3) (rational 5 3)))
;    ; same denom, rat2
;    (b= (b+ (rational 5 3) (rational 5 3)))
;    (b= (b+ (rational 5 3) (rational -5 3)))
;    (b= (b+ (rational 5 3) (rational 5 -3)))
;    (b= (b+ (rational 5 3) (rational -5 -3)))

; else
;(b+ "asdf" 2)
;; b-
;(b- 1 2)
;(b- 8 (rational 2 3))
;(b- (rational 5 12) 2)
;(b- (rational 1 2) (rational 4 5))
;(b- (rational 5 3) (rational 5 3))
;(b- "asdf" 2)
;;n-ary operators
; +
; *
; /
; =
; eqv?
; equal?
; w that works for rationals

; gcd
;(define (gcd . l)
;    (cond
;        ((null? l) 0)
;    )
;)

; (gcd)
; (gcd 3)
; (gcd 6 9)
; (gcd 1764 42)


;; if have time
    ; lcm
    ;; n-ary operators
    ; max
    ; min
    ; =
    ; <
    ; >
    ; <=
    ; >=
    ; assq
    ; assv
    ; assoc