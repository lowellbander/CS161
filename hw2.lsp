; (1) Depth-First Search
(defun DFS (tree)
  (cond
    ((NULL tree) NIL)
    ((atom (car tree)) (cons (car tree) (DFS (cdr tree))))
    (t (append (DFS (car tree)) (DFS (cdr tree))))
  )
)

; (2) Depth-First Iterative-Deepening Search

(defun DFS-N (tree depth)
  (cond
    ((equal depth 0) NIL)
    ((NULL tree) NIL)
    ((atom (car tree)) (cons (car tree) (DFS-N (cdr tree) depth)))
    (t (append (DFS-N (car tree) (- depth 1)) (DFS-N (cdr tree) depth)))
  )
)

(defun until (tree depth max-depth)
  (cond
    ((> depth max-depth) NIL)
    (t (append (DFS-N tree depth) (until tree (+ depth 1) max-depth)))
  )
)

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

