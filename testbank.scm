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
; gcd TODO
(gcd 1764 42)
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
; equal? TODO
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
    
;; if have time
    ; abs
        (abs -1)
        (abs 1)
        (abs (rational 5 1))
        (abs (rational 5 -1))
        (abs (rational -5 1))
        (abs (rational -5 -1))
    ; lcm
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
    ; min
    ; =
    ; <
    ; >
    ; <=
    ; >=
    ; assq
    ; assv
    ; assoc

; - Baumgartnter's tests
    (eqv? 'x 'x)
    (+ 1 2 3 4 5)
    (caar '((a b) (c d)))
    (list 1 2 3 4 5)
    (map (lambda (x) (b+ x 1)) '(1 2 3 4 5))
    (/ (* 2 3) '(rational 1 7))
    (/ '(rational 1 7) (* 2 3))