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
; +
    ; b+
    (b+ 1 2)
    (b+ 8 (rational 2 3))
    (b+ (rational 5 12) 2)
    (b+ (rational 1 2) (rational 4 5))
    (b+ (rational 5 3) (rational 5 3))
    (b+ "asdf" 2)
; *
    ; b*
    (b* 1 2)
    (b* 8 (rational 2 3))
    (b* (rational 5 12) 2)
    (b* (rational 1 2) (rational 4 5))
    (b* (rational 5 3) (rational 5 3))
    (b* "asdf" 2)
; -
    ; b-
    (b+ 1 2)
    (b+ 8 (rational 2 3))
    (b+ (rational 5 12) 2)
    (b+ (rational 1 2) (rational 4 5))
    (b+ (rational 5 3) (rational 5 3))
    (b+ "asdf" 2)
; /
    ; b/
    (b+ 1 2)
    (b+ 8 (rational 2 3))
    (b+ (rational 5 12) 2)
    (b+ (rational 1 2) (rational 4 5))
    (b+ (rational 5 3) (rational 5 3))
    (b+ "asdf" 2)
; =
    ; b=
    (b+ 1 2)
    (b+ 8 (rational 2 3))
    (b+ (rational 5 12) 2)
    (b+ (rational 1 2) (rational 4 5))
    (b+ (rational 5 3) (rational 5 3))
    (b+ "asdf" 2)
; zero?
(zero? 1)
(zero? 0)
(zero? (rational 0 1))
(zero? (rational 1 0))
; positive?
(positive? -1)
(positive? 6)
(positive? (rational 5 6))
(positive? (rational 6 -1))
(positive? (rational -1 6))
; negative?
(negative? 1)
(negative? -1)
(negative? (rational 5 1))
(negative? (rational 5 -1))
(negative? (rational -5 1))
(negative? (rational -5 -1))
; eqv? doesn't need to be n-ary
; equal?
; w that works for rationals
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
; gcd
(gcd 1764 42)
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
    ; remainder
    (remainder 25 5)
    (remainder 0 42)
    (remainder 111 69)
    (remainder 42 0)
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
; (5 () 53 )
; 42
; '("Hello" "World!")
; (define (fac n) (if (b= n 0) 1 (b* n (fac (b- n 1)))))
; (fac 5)
; (+ 2 3)
; (5 2 5 3 2)
; (define test 3)
; (set! x (+ 3 4 5))
; (1 3 4 . 3)
; '(3 5 6)
; '(define x 4)
; '(define (double x) (+ x x))
; (quote (define (double x) (+ x x)))
; (quote (cond ((< x 4) 2) ((> x 9) 2) (else 10)))
; (quote ((define x 4) (define x)))
; (begin (set! x 6) (set! y 7) (* x y))
; (let (x 2) (y 4) (z 8) (* x y z))
; (cond ((= x y) 1) ((< x y) 2) (else (let (x 2) (y 4) (z 8) (* x y z))))
; (define (fac n) (if (= n 0) 1 (* n (fac (- n 1)))))
; (if (eq? x y) (+ x y) (begin (define x 5) (define (func2 x y) (* x y))))
; (lambda (x y) (+ 3 (* x y)))
; (define (list . l) l)
; (define list (lambda l l))
; (eqv? (rational 2 3) (rational 4 6))
; (rational? 2)
; (rational? (rational 4 3))
; (rational? '(rational 4 3)
; (number? 2)
; (number? (rational 4 3))
; (number? '(rational 4 3)

; - Baumgartnter's tests
(eqv? 'x 'x)
(+ 1 2 3 4 5)
(caar '((a b) (c d)))
(list 1 2 3 4 5)
(map (lambda (x) (b+ x 1)) '(1 2 3 4 5))
(/ (* 2 3) '(rational 1 7))
(/ '(rational 1 7) (* 2 3))