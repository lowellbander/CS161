; TODO: 'overall comment explaining my solutions'

; TREE-CONTAINS takes as its arguments a number N and an ordered tree TREE, and 
; returns true if N is in the TREE, else NIL.
(defun TREE-CONTAINS (N TREE)
  (cond
    (
      (and
        (numberp TREE)
        (equal N TREE)
      )
      t
    )
    (
      (and 
        (numberp TREE)
        (not (equal N TREE))
      )
      NIL
    )
    (
      (< N (cadr TREE))
      (TREE-CONTAINS N (car TREE))
    )
    (
      (> N (cadr TREE))
      (TREE-CONTAINS N (caddr TREE))
    )
    (
      t
      (equal N (cadr TREE))
    )
  )
)

(defun TREE-MAX (TREE))
(defun TREE-ORDER (TREE))
(defun SUB-LIST (L START LEN))
(defun SPLIT-LIST (L))
(defun BTREE-HEIGHT (TREE))
(defun LIST2BTREE (LEAVES))
(defun BTREE2LIST (TREE))

; TESTS

(defun tests ()
  (and

    (TREE-CONTAINS 3 3)
    (TREE-CONTAINS 3 '(3 4 5))
    (not (TREE-CONTAINS 1 '(3 4 5)))
    (TREE-CONTAINS 3 '((1 2 3) 7 8))
    (not (TREE-CONTAINS 4 '((1 2 3) 7 8)))
    (TREE-CONTAINS 2 '(1 2 3))

  )
)
