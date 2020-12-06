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
                                    (if (= x (round x)) #t #f)
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

; numerator?
(define (numerator rat) (let ((result (simplify rat)))
    (if (integer? result) result (cadr result))))

; denominator?
(define (denominator rat) (let ((result (simplify rat)))
    (if (integer? result) 1 (caddr result))))

; quotient
(define (quotient a b) (let ()
    (define (getq a b q)
            (let ((diff (- a b)))
                (cond
                    ((< diff 0) q)
                    ((= diff 0) (+ q 1))
                    (else (getq diff b (+ q 1)))
                )
            ))
    (if (b= 0 b) (display "Don't divide by zero.") (getq a b 0)))
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
; simplify
(define (simplify rat) 
    (cond
        ((integer? rat) rat)
        ((rational? rat)
            (let* ((num (cadr rat))
                (den (caddr rat))
                (ratgcd (bgcd num den))
                (newnum (b/ num ratgcd))
                (newden (b/ den ratgcd)))
                (if (= 1 newden) newnum (rational newnum newden))))
        (else rat))
)

; negative?
(define (negative? x)
    (cond
        ((integer? x)
            (b< x 0))
        ((rational? x)
            (if (b< (numerator x) 0) #t
                (if (b< (denominator x) 0) #t #f)))
        (else (b< x 0))
    )
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