; TODO: backtracking
; TODO: note on coordinate system, representation of game state
; TODO: comments on all functions
;
; CS 161
; Homework 4
; Lowell Bander
; UID 204 156 534

; The function QUEENS takes as its argument a dimension N, and returns a
; solution to the N queens problem on an NxN chessboard.
(defun queens (n)
  (solve-all nil 1 n n)
)

; (solve-all nil 0 4) ; call form for first attempt if n = 4
(defun solve-all (solution column nColumns nRows)
  (cond
    ((equal column nColumns) (solve-column solution 1 nRows))
    (t (solve-all (solve-column solution 1 nRows) (+ 1 column) nColumns nRows))
  )
)

; (solve-column nil 1 4) ; call form for first attempt if n = 4
; try pushing 1, 2, 3, ... n
; if all attempts fail, return nil
; else, return the first attempt that succeeds
(defun solve-column (solution candidate nRows)
  (let* (
      (attempt (append solution (list candidate)))
    )
    (cond
      ((valid attempt) attempt) ; columns thus far are valid
      ((equal candidate nRows) nil) ; puzzle isn't solvable
      (t (solve-column solution (+ 1 candidate) nRows))
    )
  )
)

; VALID returns T if SOLUTION satisfies the constraint of the problem, else NIL.
(defun valid (solution)
  (and
    (rook-valid solution)
    (bishop-valid solution)
  )
)

(defun rook-valid (solution)
  (unique solution)
)

(defun unique (items)
  (cond
    ((null items) t)
    ((contains (first items) (rest items)) nil)
    (t (unique (rest items)))
  )
)

(defun contains (needle haystack)
  (cond
    ((null haystack) nil)
    ((equal needle (first haystack)) t)
    (t (contains needle (rest haystack)))
  )
)

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

