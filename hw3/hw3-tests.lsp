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

(run-tests)

