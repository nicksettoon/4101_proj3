;; Don't Panic
; number?
(number? 5)
(number? (rational 3 5))
; integer?
(integer? "don't panic")
(integer? 1)
(integer? (rational 1 2))
; rational?
(define x (rational 44 6))
(rational? x)
(rational? (rational 4 5))
(rational? '(rational 4 5))
(rational? 3)

;;nary operators
(+ 3 (- third fourth half fifth) 4 2 5)
(/ 68040 5 6 9 2 3)
(+ (* 3 2) (- 2 4 1 3))
(= (* fourth fourth) (* half half half half))
(= 3 3 3 3 (rational 9 3))
(= third (/ (* 3 third) 3))
(+ (rational 1 2) (rational 1 3) (rational -1 2) (rational 1 3))
(+ (rational 1 2) (rational -1 3))
(+ (rational 1 2) 4)
(+ 8 3 4 (rational 1 2) 4)

; gcd 
; +
; b+
;; int-int
(b= 3 (b+ 1 2))
;; int-rat
(b= (rational 1 -2) (b+ 4 (rational 9 -2)))
(b= (rational 17 2) (b+ 4 (rational -9 -2)))
(b= (rational 17 -2) (b+ -4 (rational 9 -2)))
(b= (rational 1 2) (b+ -4 (rational -9 -2)))
;; rat-int
(b= (rational 1 -2) (b+ (rational 9 -2) 4))
(b= (rational 17 2) (b+ (rational -9 -2) 4))
(b= (rational 17 -2) (b+ (rational 9 -2) -4))
(b= (rational 1 2) (b+ (rational -9 -2) -4))
;; rat-rat
(b= (rational 13 10) (b+ (rational -1 -2) (rational 4 5)))
(b= (rational 3 10) (b+ (rational 1 -2) (rational 4 5)))
(b= 0 (b+ (rational 5 -3) (rational 5 3)))
(b= (rational 10 3) (b+ (rational -5 -3) (rational 5 3)))
(b+ "asdf" 2)
; -
; b-
;; int-int
(b= -1 (b- 1 2))
(b= 1 (b- -1 -2))
(b= 3 (b- 1 -2))
(b= -3 (b- -1 2))
;; int-rat
(b= (rational 17 2) (b- 4 (rational 9 -2)))
(b= (rational 1 -2) (b- 4 (rational -9 -2)))
(b= (rational 1 2) (b- -4 (rational 9 -2)))
(b= (rational -17 2) (b- -4 (rational -9 -2)))
;; rat-int
(b= (rational 17 -2) (b- (rational 9 -2) 4))
(b= (rational 1 2) (b- (rational -9 -2) 4))
(b= (rational 1 -2) (b- (rational 9 -2) -4))
(b= (rational 17 2) (b- (rational -9 -2) -4))
;; rat-rat
(b= (rational 3 -10) (b- (rational -1 -2) (rational 4 5)))
(b= (rational 13 -10) (b- (rational 1 -2) (rational 4 5)))
(b= (rational 10 -3) (b- (rational 5 -3) (rational 5 3)))
(b= 0 (b- (rational -5 -3) (rational 5 3)))
(b- "asdf" 2)
; *
; b*
;; int-int
(b= 2 (b* 1 2))
(b= -2 (b* -1 2))
;; int-rat
(b= -18 (b* 4 (rational 9 -2)))
(b= 18 (b* 4 (rational -9 -2)))
(b= -18 (b* -4 (rational -9 -2)))
(b= 18 (b* -4 (rational 9 -2)))
;; rat-int
(b= 18 (b* (rational 9 -2) -4))
;(b= -18 (b* (rational 9 -2) 4))
;(b= 18 (b* (rational -9 -2) 4))
;(b= -18 (b* (rational -9 -2) -4))
;; rat-rat
(b= (rational 2 5) (b* (rational -1 -2) (rational 4 5)))
(b= (rational -2 5) (b* (rational 1 -2) (rational 4 5)))
(b= (rational 25 -9) (b* (rational 5 -3) (rational 5 3)))
(b= (rational 25 9) (b* (rational -5 -3) (rational 5 3)))
(b+ "asdf" 2)
; /
; b/
;; int-int
(b= 2 (b/ 2 1))
(b= -2 (b/ -2 1))
(b= -2 (b/ 2 -1))
(b= 2 (b/ -2 -1))
(b= -1 (b/ -1 1))
(b= -1 (b/ 1 -1))
(b= 1 (b/ 1 1))
(b= 1 (b/ -1 -1))
(b= (rational 1 2) (b/ 1 2))
(b= (rational 1 -2) (b/ -1 2))
(eq? #f (b= 4 (b/ 9 3)))
(b= 3 (b/ 9 3))
(b= (rational 1 4) (b/ 8 32))
;; int-rat
(b= (rational 8 -9) (b/ 4 (rational 9 -2)))
(b= (rational -8 -9) (b/ 4 (rational -9 -2)))
(b= (rational 8 -9) (b/ -4 (rational -9 -2)))
(b= (rational 8 9) (b/ -4 (rational 9 -2)))
;; rat-int
(b= (rational 1 4) (b/ (rational 9 -2) -18))
(b= (rational 1 -4) (b/ (rational 9 -2) 18))
(b= (rational 1 4) (b/ (rational -9 -2) 18))
(b= (rational 1 -4) (b/ (rational -9 -2) -18))
;; rat-rat
(b= (rational 5 8) (b/ (rational -1 -2) (rational 4 5)))
(b= (rational -5 8) (b/ (rational 1 -2) (rational 4 5)))
(b= -1 (b/ (rational 5 -3) (rational 5 3)))
(b= 1 (b/ (rational -5 -3) (rational 5 3)))
(b+ "asdf" 2)
; =
; b=
; b< 
(b< 1 2)
(b< -3 4) 
(b< -8 -4)
(eq? #f (b< 4 -8))
(eq? #f (b< -3 -4))
(eq? #f (b< 1 -2))
;; int-rat
(eq? #f (b< 4 (rational 9 -2)))
(b< 4 (rational -9 -2))
(eq? #f (b< 2 (rational 1 2)))
(eq? #f (b< -4 (rational 9 -2)))
(b< -4 (rational -9 -2))
;; rat-int
(b< (rational 9 -2) 4)
(eq? #f (b< (rational -9 -2) 4))
(b< (rational 9 -2) -4)
(b< (rational 1 2) 2)
(eq? #f (b< (rational -9 -2) -4))
;; rat-rat
(b< (rational -1 -2) (rational 4 5))
(b< (rational 5 -3) (rational 5 4))
(b< (rational 7 6) (rational 9 4))
(eq? #f (b< (rational -5 -3) (rational 5 3)))
(b< "asdf" 2)
; zero?
(zero? 1)
(zero? 0)
(zero? (rational 0 1))
(zero? (rational 1 0))
; positive?
(eq? #f (positive? -1))
(eq? #f (positive? (rational 6 -1)))
(eq? #f (positive? (rational -1 6)))
(positive? 6)
(positive? (rational 5 6))
(positive? (rational -1 -6))
; negative?
(eq? #f (negative? 6))
(eq? #f (negative? (rational 1 1)))
(eq? #f (negative? (rational -2 -1)))
(negative? -1)
(negative? (rational -1 1))
(negative? (rational 1 -1))
; eqv? doesn't need to be n-ary
(eqv? #t #t)
(eqv? 2 2)
(eq? #f (eqv? #t #f))
(eq? #f (eqv? 1 2))
(eq? #f (eqv? 1 #t))
(eq? #f (eqv? #t 1))
(eqv? (rational 1 2) (rational 1 2))
(eq? #f (eqv? (rational 1 6) (rational 1 2)))
; numerator
(numerator 1)
(numerator (rational 6 1))
(numerator (rational 6 -1))
(numerator (rational -6 1))
(numerator (rational -6 -1))
; denominator
(denominator x)
(denominator 1)
(denominator (rational 6 1))
(denominator (rational 6 -1))
(denominator (rational -6 1))
(denominator (rational -6 -1))
; equal?
(equal? '() '())
(eq? #f (equal? 1 '()))
(eq? #f (equal? '() 1))
(equal? (rational 1 2) (rational 2 4))
(eq? #f (equal? (rational 1 7) (rational 2 4)))
(equal? (rational 1 8) (list 'rational 1 8))
(eq? #f (equal? (rational 1 8) (list 1 8)))
(eq? #f (equal? (list 1 8) (rational 1 8)))
(eq? #f (equal? (list 1 2 3 4) (list 8 2 4 1)))
(eq? #f (equal? (list 8 2 4 1) (list 1 2 3 4)))
(equal? (list 1 2 3 4) (list 1 2 3 4))
(equal? (list 1 (list 2 3 4) 3 4) (list 1 (list 2 3 4) 3 4))
(eq? #f (equal? (list 1 (list 2 4) 3 4) (list 1 (list 2 3 4) 3 4)))

; w that works for rationals TODO
(define x 42)
(define (panic? x) (if x (display "Don't.") (display "Good.")))
(w "asdfasdf")
(w (cons 1 2))
(w '(cons 1 2))
(w (rational 3 2))
(w (cons (rational 2 3) (rational 3 5)))
(w '(rational 3 2))
(w (list 1 2 3 4 5))
(w '(1 2 3 4 5))
(w 1)
(w (* 2 3))
(w panic?)
(w (panic? #t))
(w (panic? #f))
(w x)
; abs
(abs -1)
(abs 1)
(abs (rational 5 1))
(abs (rational 5 -1))
(abs (rational -5 1))
(abs (rational -5 -1))
; quotient
(quotient 126 3)
(quotient 0 42)
(quotient 28 5)
(quotient 42 0)
(quotient 36 2)
(quotient -36 -2)
(quotient -36 2)
(quotient 36 -2)
; remainder
(remainder 25 5)
(remainder 0 42)
(remainder 111 69)
(remainder 42 0)
;; more n-ary operators
; max
(max (list 1 2 5454 15 24 123 4 15 51 2 15 1))
; min
(min (list 1 2 5454 15 24 123 4 15 51 2 15 1))

; - Baumgartnter's tests
(eqv? 'x 'x)
(+ 1 2 3 4 5)
(caar '((a b) (c d)))
(list 1 2 3 4 5)
(map (lambda (x) (b+ x 1)) '(1 2 3 4 5))
(/ (* 2 3) '(rational 1 7))
(/ '(rational 1 7) (* 2 3))