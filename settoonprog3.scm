; helper functions for getting un-simplified num and den of rational
(define (num x) (cadr x))
(define (den x) (caddr x))
; +
(define (+ . l)
  (if (null? l) 0
      (b+ (car l) (apply + (cdr l))))
)
; *
(define (* . l)
  (if (null? l) 1
      (b* (car l) (apply * (cdr l))))
)
; -
(define (- . l)
    (if (null? l) 0
        (b- (car l) (apply + (cdr l))))
)
; /
(define (/ . l)
    (if (null? l) 0
        (b/ (car l) (apply * (cdr l))))
)

; rational
(define (rational n d) (list 'rational n d))

; integer?
(define (integer? x)
    (if (boolean? x) #f
        (if (symbol? x) #f
            (if (char? x) #f
                (if (vector? x) #f
                    (if (procedure? x) #f
                        (if (pair? x) #f
                            (if (string? x) #f
                                    (if (s48b= x (round x)) #t #f)
                            )
                        )
                    )
                )
            )
        )
    )
)

; rational?
(define (rational? rat)
    (if (integer? rat) #t
        (if (pair? rat)
            (if (eq? 'rational (car rat))
                (if (pair? (cdr rat))
                    (if (pair? (cddr rat))
                        (if (null? (cdddr rat))
                            (let ((num (cadr rat))
                                (den (caddr rat)))
                                (if (integer? num)
                                    (if (integer? den) #t #f)
                                    #f))
                        #f)
                    #f)
                #f)
            #f)
        #f)
    )
)

; number?
(define number? rational?)

; numerator
(define (numerator rat) (let ((result (simplify rat)))
    (if (integer? result) result (cadr result)))
)

; denominator
(define (denominator rat) (let ((result (simplify rat)))
    (if (integer? result) 1 (caddr result)))
)

; quotient
(define (quotient a b)
    (let ()
        (define (getq a b q)
            (let ((diff (b- (abs a) (abs b))))
                (cond
                    ((< diff 0) q)
                    ((= diff 0) (b+ q 1))
                    (else (getq diff b (b+ q 1)))
                )
            ))
    (cond
        ((b= 0 b) (display "Don't divide by zero."))
        (else
            (let ((q (getq a b 0)))
                (if (negative? (rational a b)) (b* -1 q) q)))))
)

; remainder
(define (remainder a b)
    (let ((q (quotient a b)))
        (- a (* b q))
    )
)

; bgcd
(define (bgcd a b) 
    (let
        ((a (abs a))
        (b (abs b)))
        (cond 
            ((b= 0 a) b)
            ((b= 0 b) a)
            ((b= 0 (remainder a b)) b)
            (else (bgcd b (remainder a b)))
        )
    )
)

; nary gcd
(define (gcd . l)
  (if (null? l) 0
      (bgcd (car l) (apply gcd (cdr l)))))

; simplify
(define (simplify rat) 
    (cond
        ((integer? rat) rat)
        ((rational? rat)
            (cond
                ((b= (abs (num rat)) (abs (den rat))) ; if num=denom
                    (if (negative? rat) -1 1))
                ((b= 1 (den rat)) (num rat))
                ((b= -1 (den rat)) (b* -1 (num rat)))
                ((b= 0 (num rat)) 0)
                (else 
                    (let* ((n (num rat))
                        (d (den rat))
                        (ratgcd (bgcd n d))
                        (newnum (b/ n ratgcd))
                        (newden (b/ d ratgcd))
                        (int? (b= 1 (abs newden))))
                        (if int?
                            (b/ (b* newnum d) ratgcd)
                            (cond
                                ((positive? n)
                                    (if (negative? d)
                                        (rational (b* -1 newnum) (b* -1 newden))
                                        (rational newnum newden)))
                                ((positive? d)
                                    (rational newnum newden))
                                (else
                                    (rational (abs newnum) (abs newden)))))))))
        (else rat))
)

; negative?
(define (negative? x)
    (cond
        ((integer? x)
            (b< x 0))
        ((rational? x)
            (if (b< (num x) 0)
                (if (b< (den x) 0) #f #t)
                (if (b< (den x) 0) #t #f)))
        (else (b< x 0)))
)

; positive?
(define (positive? x)
    (cond
        ((integer? x)
            (b< 0 x))
        ((rational? x)
            (if (b< 0 (numerator x))
                (if (b< 0 (denominator x)) #t #f)
                #f))
        (else (b< 0 x))
    )
)

; abs
(define (abs x)
    (if (negative? x)
        (cond
            ((integer? x) (b* -1 x))
            ((rational? x)
                (rational (abs (numerator x)) (abs(denominator x))))
        )
    x)
)

; zero
(define (zero? x) 
    (cond
        ((integer? x) (b= 0 x))
        ((rational? x) (b= 0 (numerator x)))
        (else (b= 0 x))
    )
)

(define (mkrat int rat) ; turns num into a rational that can be added to rat
    (let ((d (abs (den rat))))
        (rational (b* int d) d)
    )
)

; b+ 
(define (b+ x y)
    (let* ((x (simplify x))
           (y (simplify y))
           (case (check x y)))
        (cond
            ((b= case int-int)
                (s48b+ x y))
            ((b= case int-rat)
                (let
                    ((ratx (mkrat x y)))
                    (simplify (rational (b+ (num ratx) (num y)) (den y)))))
            ((b= case rat-int)
                (b+ y x))
            ((b= case rat-rat)
                (let ((n1 (num x))
                       (d1 (den x))
                       (n2 (num y))
                       (d2 (den y)))
                    (if (b= d1 d2)
                        (simplify (rational (b+ n1 n2) d1))
                        (let ((newd (b* d1 d2))
                              (newn1 (b* n1 d2))
                              (newn2 (b* n2 d1)))
                            (simplify (rational (b+ newn1 newn2) newd))))))
            (else (s48b+ x y))))
)

; b*
(define (b* x y)
    (let* ((x (simplify x))
           (y (simplify y))
           (case (check x y)))
        (cond
            ((b= case int-int)
                (s48b* x y))
            ((b= case int-rat)
                (simplify (rational (b* x (num y)) (den y))))
            ((b= case rat-int)
                (b* y x))
            ((b= case rat-rat)
                (let* ((n1 (num x))
                      (d1 (den x))
                      (n2 (num y))
                      (d2 (den y))
                      (newn (b* n1 n2))
                      (newd (b* d1 d2)))
                    (simplify (rational newn newd))))
            (else (s48b* x y))
        )
    )
)

;; b-
(define (b- x y)
    (let* ((x (simplify x))
           (y (simplify y))
           (case (check x y)))
        (if (negative? y)
            (b+ x (abs y))
            (b+ x (b* -1 y))))
)

; b=
(define (b= x y)
    (let* ((x (simplify x))
           (y (simplify y))
           (case (check x y)))
        (cond
            ((s48b= case int-int) ; TODO change to b=
                (s48b= x y))
            ((s48b= case int-rat); TODO change to b=
                #f)
            ((s48b= case rat-int); TODO change to b=
                #f)
            ((s48b= case rat-rat); TODO change to b=
                (let ((n1 (num x))
                      (d1 (den x))
                      (n2 (num y))
                      (d2 (den y)))
                    (if (b= n1 n2)
                        (if (b= d1 d2) #t #f)
                        #f)))
            (else (s48b= x y))))
)

; b<
(define (b< x y)
    (let* ((x (simplify x))
           (y (simplify y))
           (case (check x y)))
        (cond
            ((b= case int-int)
                (s48b< x y))
            ((b= case int-rat)
                (let* ((q (quotient (num y) (den y)))
                      (diff (b- x q)))
                    (cond
                        ((negative? x)
                            (if (negative? y)
                                (if (b< (abs x) (abs y)) #f #t)
                                (if (positive? diff) #f #t)))
                        ; if diff is not pos, its 0 or neg, if 0 => q+rem > x, if neg, just q > x, for both y > x
                        (else (if (positive? diff) #f #t)))))
            ((b= case rat-int)
                (let* ((q (quotient (num x) (den x)))
                      (diff (b- y q)))
                    (cond
                        ((negative? x)
                            (if (negative? y)
                                (if (b< (abs x) (abs y)) #f #t)
                                (if (positive? diff) #t #f)))
                            ; if diff is not post its 0 or neg.
                            ;if 0, then q+rem > y and x !< y #f, if neg, q > y and x !< y again
                            ; if diff is pos, then y < q, remainder doesn't matter
                            (else (if (positive? diff) #t #f)))))
            ((b= case rat-rat)
                (let* ((q1 (quotient (num x) (den x)))
                       (q2 (quotient (num y) (den y)))
                       (r1 (remainder (num x) (den x)))
                       (r2 (remainder (num y) (den y)))
                       (qdiff (b- q1 q2))
                       (rdiff (b- r1 r2)))
                      (if (negative? qdiff)
                          #t ; y > x
                          (if (zero? qdiff); check remainders
                                (if (negative? rdiff)
                                    #t ; y > x
                                    #f); y < x
                                #f))))
            (else (s48b< x y))))
)

; inverse
(define (inverse x)
    (cond
        ((integer? x)
            (simplify (rational 1 x)))
        ((rational? x)
            (simplify (rational (denominator x) (numerator x))))
    )
)

; b/
(define (b/ x y)
    (let* ((x (simplify x))
           (y (simplify y))
           (case (check x y)))
        (cond
            ((b= case int-int)
                (if (zero? y)
                    (display "Please don't divide by 0.")
                    (if (zero? (remainder x y))
                        (quotient x y)
                        (simplify (rational x y)))))
            (else
                (simplify (b* x (inverse y))))))
)

; eqv?
(define (eqv? x y)
    (cond
        ((number? x)
            (if (number? y) (b= x y) #f))
        (else (eq? x y)))
)

; equal?
(define (equal? x y)
    (cond
        ((eq? x '())
            (if (eq? y '()) #t #f)) ; if both x and y are '()
        ((eq? y '()) #f)
        ((rational? x)
            (if (rational? y) ; if both are rationals
                (eqv? x y) #f))
        ((pair? x)
            (if (pair? y) ; if both are pairs?
                (if (equal? (car x) (car y)) ; if the cars are equal
                    (equal? (cdr x) (cdr y)) #f) #f))
        ((pair? y) #f) ; if only y is pair
        (else (eqv? x y))

    )
)
; =
(define (= x y . l)
    (if (null? l) (b= x y)
        (and (b= x y) (apply = (cons y l))))
)

; <
(define (< x y . l)
    (if (null? l) (b< x y)
        (and (b< x y) (apply < (cons y l))))
)

; >
(define (> x y . l)
    (if (null? l) (b> x y)
        (and (b> x y) (apply > (cons y l))))
)

; <=
(define (<= x y . l)
    (if (null? l) (b<= x y)
        (and (b<= x y) (apply <= (cons y l))))
)

; >=
(define (>= x y . l)
    (if (null? l) (b>= x y)
        (and (b>= x y) (apply >= (cons y l))))
)

; max
    (define (max l) 
        (let ()
            (define (getm cmax x)
                (cond
                    ((null? x) cmax)
                    (else (bmax (car x) (getm cmax (cdr x))))))
            (getm (car l) (cdr l)))
    )
    ; bmax
    (define (bmax x y)
        (if (b< x y) y x))


; min
    (define (min l) 
        (let ()
            (define (getmn cmin x)
                (cond
                    ((null? x) cmin)
                    (else (bmin (car x) (getm cmin (cdr x))))))
            (getmn (car l) (cdr l))))
    ; bmin
    (define (bmin x y)
        (if (b< x y) x y)
    )


(define int-int 1)
(define int-rat 2)
(define rat-int 3)
(define rat-rat 4)
(define undef 5)

(define (check x y)
    (cond
        ((integer? x)
            (cond
                ((integer? y) int-int)
                ((rational? y) int-rat)
                (else undef)))
        ((rational? x)
            (cond
                ((integer? y) rat-int)
                ((rational? y) rat-rat)
                (else undef)))
        (else undef))
)

(define half (rational 1 2))
(define third (rational 1 3))
(define fourth (rational 1 4))
(define fifth (rational 1 5))
; check test cases
; (check 1 2)
; (check 1 (rational 3 2))
; (check (rational 1 2) 3)
; (check (rational 1 2) (rational 4 6))
; (check 2 "asdf")
; (check (rational 2 3) "asdf")
; (check "asdf" 45)