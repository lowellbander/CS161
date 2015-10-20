(load 'hw2.lsp)
(load 'lisp-unit.lisp)
(use-package :lisp-unit)
(define-test mc-dfs
  (assert-equal '(nothing here) (mc-dfs '(3 3 nil) '(nothing here)))
)
(run-tests)
