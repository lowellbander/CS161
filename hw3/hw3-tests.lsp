(load '../lisp-unit.lisp)
(load 'hw3.lsp)
(use-package :lisp-unit)

(define-test h0
  (assert-equal 0 (h0 'foo))
)

(define-test has
  (assert-true (has 'foo '(foo bar baz)))
  (assert-false (has 'foo '(bar baz)))
)

(define-test goal-test
  (assert-true (goal-test '((1 1 1)
                            (1 5 1)
                            (1 1 1))
               )
  )
  (assert-false (goal-test '((1 1 1)
                             (1 2 1)
                             (1 1 1))
                )
  )
)

(define-test countBoxes
  (assert-equal 3 (countBoxes '(0 1 2 3 4 2 5 6 2) 0))
)

(define-test h1
  (assert-equal 3 (h1 '((1 2 3)
                        (3 1 2)
                        (2 3 1))))
)

(define-test absolute
  (assert-equal 5 (absolute 5))
  (assert-equal 5 (absolute -5))
)

(define-test delta
  (assert-equal 3 (delta '(1 2 1 2 4 1 2 5 2) 0 0))
  (assert-equal 3 (delta '(1 4 1 4 2 1 4 5 4) 0 0))
)

(define-test outOfBounds
  (assert-true (outOfBounds '((1 1 1)(1 1 1)(1 1 1)) -1 1))
  (assert-true (outOfBounds '((1 1 1)(1 1 1)(1 1 1)) 1 -1))
  (assert-true (outOfBounds '((1 1 1)(1 1 1)(1 1 1)) 1 3))
  (assert-true (outOfBounds '((1 1 1)(1 1 1)(1 1 1)) 3 1))
  (assert-false (outOfBounds '((1 1 1)(1 1 1)(1 1 1)) 1 1))
)

(define-test get-square
  (assert-equal 1 (get-square '((1 2 3)(1 3 2)(2 2 2)) 0 0))
  (assert-false (get-square '((1 2 3)(1 3 2)(2 2 2)) 4 0))
)

(define-test set-square
  (assert-false (set-square '((1 2 3)(4 5 6)(7 8 9)) 4 0 'A))
  (assert-equal
    '((1 2 3)(4 A 6)(7 8 9))
    (set-square '((1 2 3)(4 5 6)(7 8 9)) 1 1 'A)
  )
)

(run-tests)

