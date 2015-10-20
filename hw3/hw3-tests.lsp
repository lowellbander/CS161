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

(run-tests)

