(load 'hw1.lsp)
 
(defmacro unit-test (expr result)
    `(unless (unit-test ,expr ,result)
            (error (format 'nil "Unit test failed: ~A => ~A, expected ~A" ',expr ,expr, result))))

(unit-test (TREE-CONTAINS 3 3) t)
(unit-test (TREE-CONTAINS 3 '(3 4 5)) t)
(unit-test (TREE-CONTAINS 1 '(3 4 5)) NIL)
(unit-test (TREE-CONTAINS 3 '((1 2 3) 7 8)) t)
(unit-test (TREE-CONTAINS 4 '((1 2 3) 7 8)) NIL)
(unit-test (TREE-CONTAINS 2 '(1 2 3)) t)

(unit-test (TREE-MAX '((1 2 3) 7 8)) 8)
(unit-test (TREE-MAX '((1 2 3) 7 (8 9 10))) 10)

(unit-test (TREE-ORDER 3) '(3))
(unit-test (TREE-ORDER '(1 2 3)) '( 1 2 3))
(unit-test (TREE-ORDER '((1 2 3) 7 8)) '(1 2 3 7 8))

(unit-test (SUB-LIST '(1 2 3) 0 3) '(1 2 3))
(unit-test (SUB-LIST '(a b c d) 0 3) '(a b c))
(unit-test (SUB-LIST '(a b c d) 3 1) '(d))
(unit-test (SUB-LIST '(a b c d) 2 0) NIL)

(unit-test (SPLIT-LIST '(a b c d)) '((a b) (c d)))
(unit-test (SPLIT-LIST '(a b c d e)) '((a b) (c d e)))
(unit-test (SPLIT-LIST '(a b c d e f)) '((a b c) (d e f)))

(unit-test (BTREE-HEIGHT 1) 0)
(unit-test (BTREE-HEIGHT '(1 2)) 1)
(unit-test (BTREE-HEIGHT '(1 (2 3))) 2)
(unit-test (BTREE-HEIGHT '((1 2) (3 4))) 2)
(unit-test (BTREE-HEIGHT '((1 (2 3)) ((4 5) (6 7)))) 3)

