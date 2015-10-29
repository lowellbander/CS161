; CS 161
; Homework 4
; Lowell Bander
; UID 204 156 534
;
; This file contains a function QUEENS, which, in combination with the remaining
; functions in this file, returns a solution to the "N Queens" problem on an NxN
; chessboard for a given N. The format of the solution is a list of numbers,
; where each number refers to a row on the board. The index of a number in this
; list is interpreted as the column on the board. Lastly, the upper-left corner
; of the board is the origin with row=1, column=1. Thusly, for example, a board
; of dimensions 3x3 (n=3) with queens along the main diagonal is represented as
; the list '(1 2 3).

; The function QUEENS takes as its argument a dimension N, and returns a
; solution to the N queens problem on an NxN chessboard.
(defun queens (n)
  (solve '(1) n)
)

; The function SOLVE takes as its arguments a SOLUTION in the form of a list and
; the dimension of the board. Treating "N Queens" as a constraint satisfaction
; problem, it performs depth-first search and returns the solution to the
; problem if there is one. Else, NIL.
(defun solve (solution n)
  (let* (
      (child (get-child solution n))
      (sibling (get-sibling solution n))
    )
    (cond
      ((and (valid solution) (equal n (length solution)) solution))
      ((and child (solve child n)) (solve child n))
      ((and sibling (solve sibling n)) (solve sibling n))
      (t nil)
    )
  )
)

; The function GET-SIBLING takes as its arguments a SOLUTION and a dimension N,
; and returns a variant of SOLUTION where the leaf is replaced by its sibling,
; if it has one. Else, NIL.
(defun get-sibling (solution n)
  (cond
    ((= (lastof solution) n) nil)
    (t (increment-last solution))
  )
)

; The function GET-CHILD takes as its arguments a SOLUTION and a dimension N,
; and returns the first valid child of the SOLUTION if there is one, else NIL.
(defun get-child (solution n)
  (or-valid (get-children solution nil n))
)

; OR-VALID take as input a list ITEMS, and behaves identically to the standard
; OR function in Lisp, except that the predicate used is the function VALID.
(defun or-valid (items)
  (cond
    ((null items) nil)
    ((valid (first items)) (first items))
    (t (or-valid (rest items)))
  )
)

; GET-CHILDREN takes as input a SOLUTION, a list CHILDREN which is NIL for all
; non-recursive calls, and a dimension N. It returns all children states of
; SOLUTION without checking for validity.
(defun get-children (solution children n)
  (cond
    ((equal n (length children)) children)
    (
      (equal 0 (length children))
      ;(list (append solution '(1)))
      (get-children solution (list (append solution '(1))) n)
    )
    (
      t
      (get-children
        solution
        (append children (list (increment-last (lastof children))))
        n
      )
    )
  )
)

; INCREMENT-LAST returns ITEMS with the last element incremented by one.
(defun increment-last (items)
  (append (butlast items) (list (+ 1 (lastof items))))
)

; LASTOF returns the last element in ITEMS.
(defun lastof (items)
  (cond
    ((null items) nil)
    ((equal 1 (length items)) (first items))
    (t (lastof (rest items)))
  )
)

; VALID returns T if SOLUTION satisfies the constraint of the problem, else NIL.
(defun valid (solution)
  (and
    (rook-valid solution)
    (bishop-valid solution)
  )
)

; ROOK-VALID returns T if SOLUTION satisfies an "N Rooks" problem, else NIL.
(defun rook-valid (solution)
  (unique solution)
)

; UNIQUE returns T if the elements of ITEMS are unique, else NIL.
(defun unique (items)
  (cond
    ((null items) t)
    ((contains (first items) (rest items)) nil)
    (t (unique (rest items)))
  )
)

; CONTAINS returns T if NEEDLE is in HAYSTACK, else NIL.
(defun contains (needle haystack)
  (cond
    ((null haystack) nil)
    ((equal needle (first haystack)) t)
    (t (contains needle (rest haystack)))
  )
)

; BISHOP-VALID returns T if SOLUTION satisfies n "N Bishops" problem, else NIL.
(defun bishop-valid (solution)
  (cond
    ((null solution) t)
    (
      (bishop-helper
        (rest solution)
        (- (first solution) 1)
        (+ (first solution) 1)
      )
      (bishop-valid (rest solution))
    )
    (t nil)
  )
)

; A helper function for BISHOP-VALID, BISHOP-HELPER traverses a SOLUTION
; and returns T if the diagonals above ABOVE and below BELOW do not contain
; queens, else NIL.
(defun bishop-helper (solution above below)
  (cond
    ((null solution) t)
    (
      (or
        (equal (first solution) above)
        (equal (first solution) below)
      )
      nil
    )
    (t (bishop-helper (rest solution) (- above 1) (+ below 1)))
  )
)

