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

; BTREE takes as its argument a binary tree TREE, and returns the length of the
; longest path from the root node to the farthest leaf node.
(defun BTREE-HEIGHT (TREE)
  (cond
    ((numberp TREE) 0)
    (
      t
      (cond
        (
         (> (BTREE-HEIGHT (car TREE)) (BTREE-HEIGHT (cadr TREE)))
         (+ 1 (BTREE-HEIGHT (car TREE)))
        )
        (t (+ 1 (BTREE-HEIGHT (cadr TREE))))
      )
    )
  )
)

(defun LIST2BTREE (LEAVES)
  (cond
    ((numberp (car LEAVES)) LEAVES)
  )
)

(defun BTREE2LIST (TREE))

