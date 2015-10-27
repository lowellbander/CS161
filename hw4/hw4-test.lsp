(load '../lisp-unit.lisp)
(load 'hw4.lsp)
(use-package :lisp-unit)

(define-test solve-column
  (assert-equal '(1) (solve-column nil 1 1))
)

(run-tests)

