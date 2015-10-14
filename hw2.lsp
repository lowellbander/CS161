; UCLA CS 161, Fall 2016
; Professor: Adnan Darwiche
; Student: Lowell Bander
;
; Not much can be said about my overall approach to solving these problems other
; than that they were obviously done functionally and recursively. Each function
; has one or two base cases, and has one or two recursive cases, such that the
; portion of the problem which any particular instance of a function call has
; responsibility for can either be delegated to a trivial instance, or to a
; joint recursive call on the current and all remaining portions of the problem.

; (1) Depth-First Search.

; The function DFS takes as its argument the list
; representation of a tree, and returns a single, top-level list of the
; terminal nodes in the order that they would be visited by a left-to-right
; depth-first search.
(defun DFS (tree)
  (cond
    ((NULL tree) NIL)
    ((atom (car tree)) (cons (car tree) (DFS (cdr tree))))
    (t (append (DFS (car tree)) (DFS (cdr tree))))
  )
)

; (2) Depth-First Iterative-Deepening Search

; The function DFS-N takes as its arguments a list representation of a tree and
; a depth as a number, and returns a single top-evel list of the terminal nodes
; in the order that they would be visited by a left-to-right depth-first search,
; where nodes deeper than depth are ignored.
(defun DFS-N (tree depth)
  (cond
    ((equal depth 0) NIL)
    ((NULL tree) NIL)
    ((atom (car tree)) (cons (car tree) (DFS-N (cdr tree) depth)))
    (t (append (DFS-N (car tree) (- depth 1)) (DFS-N (cdr tree) depth)))
  )
)

; The function until takes as its arguments a list representation of a tree, a
; depth as a number, and a max-depth also as a number, and returns a single
; top-level list of the terminal nodes in the order that they would be visited
; by a left-to-right depth-first iterative-deepening search starting from depth
; depth and ending at depth max-depth.
(defun until (tree depth max-depth)
  (cond
    ((> depth max-depth) NIL)
    (t (append (DFS-N tree depth) (until tree (+ depth 1) max-depth)))
  )
)

; The function DFID takes as its arguments a list representation of a tree and
; depth as a number, and returns a single top-level list of the terminal nodes
; in the order that they would be visited by a left-to-right depth-first
; iterative-deepening search.
(defun DFID (tree max-depth)
  (until tree 1 max-depth)
)

(defun tests ()
  (and
    (equal (DFS '(a)) '(a))
    (equal (DFS '(a b c)) '(a b c))
    (equal (DFS '((a (b)) c (d))) '(a b c d))
    (equal (DFS NIL) NIL)

    (equal (DFID '((a (b)) c (d)) 3) '(c a c d a b c d))
  )
)

