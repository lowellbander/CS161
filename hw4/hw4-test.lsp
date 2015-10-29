(load '../lisp-unit.lisp)
(load 'hw4.lsp)
(use-package :lisp-unit)

(define-test solve-column
  (assert-equal '(1) (solve-column nil 1 1))
)

(define-test bishop-helper
  (assert-true (bishop-helper '(3 2) 0 2))
  (assert-false (bishop-helper '(2) 0 2))
  (assert-false (bishop-helper '(3 3) 0 2))
)

(define-test bishop-valid
  (assert-false (bishop-valid '(1 2)))
  (assert-true (bishop-valid '(1 1)))
  (assert-true (bishop-valid '(1 3)))
  (assert-true (bishop-valid '(1 3 1)))
)

(define-test lastof
  (assert-false (lastof nil))
  (assert-equal 3 (lastof '(3)))
  (assert-equal 3 (lastof '(1 2 3)))
)

(run-tests)

