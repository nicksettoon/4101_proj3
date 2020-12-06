,load ../s48.scm
,load ../test.scm
(test "Test1" '(eqv? 'x 'x))
(test "Test2" '(+ 1 2 3 4 5))
(test "Test3" '(caar '((a b) (c d))))
(test "Test4" '(list 1 2 3 4 5))
(test "Test5" '(map (lambda (x) (b+ x 1)) '(1 2 3 4 5)))
(test "Test6" '(/ (* 2 3) '(rational 1 7)))
(test "Test7" '(/ '(rational 1 7) (* 2 3)))
