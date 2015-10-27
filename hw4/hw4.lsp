; CS 161
; Homework 4
; Lowell Bander
; UID 204 156 534

; The function QUEENS takes as its argument a dimension N, and returns a
; solution to the N queens problem on an NxN chessboard.
(defun queens (n)
  nil
)

; (solve nil 1 4) ; call form for firt attempt if n = 4
; try pushing 1, 2, 3, ... n
; if all attempts fail, return nil
; else, return the first attempt that succeeds
(defun solve (solution attempt n)
  (cond
    ((equal n (length solution)) solution) ; the puzzle has been solved, done
    ;((valid (append solution (list attempt))))
  )
)

