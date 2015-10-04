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

; SUB-LIST takes as its argument a list L, a starting index START, and a length
; LEN, and returns a sublist of L of length LEN such that the first element is
; the START'th element in L
(defun SUB-LIST (L START LEN)
  (cond
    ((equal LEN 0) NIL)
    ((> START 0) (SUB-LIST (cdr L) (- START 1) LEN))
    (t (cons (car L) (SUB-LIST (cdr L) 0 (- LEN 1))))
  )
)

; SPLIT-LIST takes as its argument a list L, and returns a list of two lists
; L1 and L2 such that `(and (equal L (append L1 L2)) (or (equal 0 (- (length L2)
; (length L1))) (equal 1 (- (length L2) (length L1)))))` is true.
(defun SPLIT-LIST (L)
  (cond
    (
     (evenp (length L))
     (list
       (SUB-LIST L 0 (/ (length L) 2))
       (SUB-LIST L (/ (length L) 2) (- (length L) (/ (length L) 2)))
      )
    )
    (
      t
      (list
        (SUB-LIST L 0 (/ (- (length L) 1) 2))
        (SUB-LIST L (/ (- (length L) 1) 2) (- (length L) (/ (- (length L) 1) 2)))
      )
    )
  )
)

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

    (equal (SUB-LIST '(1 2 3) 0 3) '(1 2 3))
    (equal (SUB-LIST '(a b c d) 0 3) '(a b c))
    (equal (SUB-LIST '(a b c d) 3 1) '(d))
    (equal (SUB-LIST '(a b c d) 2 0) NIL)

    (equal (SPLIT-LIST '(a b c d)) '((a b) (c d)))
    (equal (SPLIT-LIST '(a b c d e)) '((a b) (c d e)))
    (equal (SPLIT-LIST '(a b c d e f)) '((a b c) (d e f)))
  )
)
