(load '../lisp-unit.lisp)
(load 'hw4.lsp)
(use-package :lisp-unit)

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

(define-test increment-last
  (assert-equal '(1 2 4) (increment-last '(1 2 3)))
)

(define-test get-children
  (assert-equal '((1 1) (1 2) (1 3)) (get-children '(1) nil 3))
)

(define-test get-child
  (assert-equal '(2 4 1 3) (get-child '(2 4 1) 4))
)

(define-test queens
  (assert-equal '(2 4 1 3) (queens 4))
  (assert-equal '(1 3 5 2 4) (queens 5))
  (assert-equal '(2 4 6 1 3 5) (queens 6))
  (assert-equal '(1 3 5 7 2 4 6) (queens 7))
)

(run-tests)

