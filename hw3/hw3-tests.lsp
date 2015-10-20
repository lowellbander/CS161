(load '../lisp-unit.lisp)
(load 'hw3.lsp)
(use-package :lisp-unit)

(define-test h0
  (assert-equal 0 (h0 'foo))
)

(run-tests)

