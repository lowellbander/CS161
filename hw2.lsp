(defun DFS (tree)
  (cond
    ((NULL tree) NIL)
    ((atom (car tree)) (cons (car tree) (DFS (cdr tree))))
    (t (append (DFS (car tree)) (DFS (cdr tree))))
  )
)

(defun tests ()
  (and
    (equal (DFS '(a)) '(a))
    (equal (DFS '(a b c)) '(a b c))
    (equal (DFS '((a (b)) c (d))) '(a b c d))
    (equal (DFS NIL) NIL)
  )
)

