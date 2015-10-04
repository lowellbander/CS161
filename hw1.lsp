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

; TREE-MAX takes as its argument an ordered tree TREE, and returns the largest 
; number in TREE.
(defun TREE-MAX (TREE)
  (cond
    ((numberp TREE) TREE)
    (t (TREE-MAX (caddr TREE)))
  )
)

; TREE-ORDER takes as its argument an ordered tree TREE, and returns an in-order
; list of the elements in TREE.
(defun TREE-ORDER (TREE)
  (cond
    ((numberp TREE) (list TREE))
    (
     t
     (append
       (TREE-ORDER (car TREE))
       (cons (cadr TREE) (TREE-ORDER (caddr TREE)))
     )
    )
  )
)

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

    (equal (TREE-MAX '((1 2 3) 7 8)) 8)
    (equal (TREE-MAX '((1 2 3) 7 (8 9 10))) 10)

    (equal (TREE-ORDER 3) '(3))
    (equal (TREE-ORDER '(1 2 3)) '( 1 2 3))
    (equal (TREE-ORDER '((1 2 3) 7 8)) '(1 2 3 7 8))
  )
)
