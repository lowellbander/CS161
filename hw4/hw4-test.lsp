(load '../lisp-unit.lisp)
(load 'hw4.lsp)
(use-package :lisp-unit)

(define-test solve
  (assert-false (solve nil 0 0))
)

(run-tests)

