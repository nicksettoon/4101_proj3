(load "./s48.scm")
(load "./done.scm")


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

;; int-int
;(eq? #f (b= 1 2))
;(eq? #f (b= -2 2))
;(b= 2 2)
;; pos rat
;(b= 8 (rational 24 3))
;(eq? #f (b= 8 (rational 2 3)))
;;negative rat
;(eq? #f (b= 8 (rational 24 -3)))
;(b= -8 (rational 24 -3))
;(b= -8 (rational -24 3))
;(eq? #f (b= -8 (rational -24 -3)))
;(b= 8 (rational -24 -3))
;; negative rat on left
;(eq? #f (b= (rational 24 -3) 8))
;(b= (rational 24 -3) -8)
;(b= (rational -24 3) -8)
;(eq? #f (b= (rational -24 -3) -8 ))
;(b= (rational -24 -3) 8 )
;; rat-rat
;; rat1 = rat2
;(b= pn-pd-rat pn-pd-rat2)
;(b= pn-nd-rat pn-nd-rat2)
;(b= nn-pd-rat nn-pd-rat2)
;(b= nn-nd-rat nn-nd-rat2)
;(b= pn-pd-int pn-pd-int2)
;(b= pn-nd-int pn-nd-int2)
;(b= nn-pd-int nn-pd-int2)
;(b= nn-nd-int nn-nd-int2)
;; (rat that reduces to int) != rat2
;(eq? #f (b= nn-nd-int nn-nd-rat2))
;(eq? #f (b= nn-pd-int nn-pd-rat2))
;(eq? #f (b= pn-nd-int pn-nd-rat2))
;(eq? #f (b= pn-pd-int pn-pd-rat2))
;; rat1 != (rat that reduces to int)
;(eq? #f (b= nn-nd-rat nn-nd-int2))
;(eq? #f (b= nn-pd-rat nn-pd-int2))
;(eq? #f (b= pn-nd-rat pn-nd-int2))
;(eq? #f (b= pn-pd-rat pn-pd-int2))