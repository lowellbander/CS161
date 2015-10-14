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

; Test cases for DFS and DFID.
(defun tests ()
  (and
    (equal (DFS '(a)) '(a))
    (equal (DFS '(a b c)) '(a b c))
    (equal (DFS '((a (b)) c (d))) '(a b c d))
    (equal (DFS NIL) NIL)

    (equal (DFID '((a (b)) c (d)) 3) '(c a c d a b c d))
  )
)

; (3) Missionaries & Cannibals

; These functions implement a depth-first solver for the missionary-cannibal
; problem. In this problem, three missionaries and three cannibals are trying to
; go from the east side of a river to the west side. They have a single boat
; that can carry two people at a time from one side of the river to the other.
; There must be at least one person in the boat to cross the river. There can
; never be more cannibals on one side of the river than missionaries. If there
; are, the cannibals eat the missionaries.

; In this implementation, a state is represented by a single list (MISSIONARIES
; CANNIBALS SIDE). SIDE represents which side the boat is currently on, and is T
; if it is on the east side and NIL if on the west side. MISSIONARIES and
; CANNIBALS represent the number of missionaries and cannibals on the same side
; as the boat. Thus, the initial state for this problem is (3 3 T) (three
; missionaries, three cannibals, and the boat are all on the east side of the
; river) and the goal state is (3 3 NIL).

; The main entry point for this solver is the function MC-DFS, which is called
; with the initial state to search from and the path to this state. It returns
; the complete path from the initial state to the goal state: this path is a
; list of intermediate problem states. The first element of the path is the
; initial state and the last element is the goal state. Each intermediate state
; is the state that results from applying the appropriate operator to the
; preceding state. If there is no solution, MC-DFS returns NIL.

; To call MC-DFS to solve the original problem, one would call (MC-DFS '(3 3 T)
; NIL) -- however, it would be possible to call MC-DFS with a different initial
; state or with an initial path.

; Examples of calls to some of the helper functions can be found after the code.

; FINAL-STATE takes a single argument (S), the current state, and returns T if
; it is the goal state (3 3 NIL) and NIL otherwise.
(defun final-state (s)
  (equal S '(3 3 NIL))
)

; NEXT-STATE returns the state that results from applying an operator to the
; current state. It takes three arguments: the current state (S), a number of
; missionaries to move (M), and a number of cannibals to move (C). It returns a
; list containing the state that results from moving that number of missionaries
; and cannibals from the current side of the river to the other side of the
; river. If applying this operator results in an invalid state (because there
; are more cannibals than missionaries on either side of the river, or because
; it would move more missionaries or cannibals than are on this side of the
; river) it returns NIL.
;
; NOTE that next-state returns a list containing the successor state (which is
; itself a list); the return should look something like ((1 1 T)).
(defun next-state (s m c)
  NIL)

; SUCC-FN returns all of the possible legal successor states to the current
; state. It takes a single argument (S), which encodes the current state, and
; returns a list of states that can be reached by applying legal operators to
; the current state.
(defun succ-fn (s)
  NIL)

; ON-PATH checks whether the current state is on the stack of states visited by
; this depth-first search. It takes two arguments: the current state (S) and the
; stack of states visited by MC-DFS (STATES). It returns T if S is a member of
; STATES and NIL otherwise.
(defun on-path (s states)
  NIL)

; MULT-DFS is a helper function for MC-DFS. It takes two arguments: the path
; from from the initial state to the current state (PATH), and the legal
; successor states to the last state on PATH (STATES). PATH is a first-in
; first-out list of states; that is, the first element is the initial state for
; the current search and the last element is the most recent state explored.
; MULT-DFS does a depth-first search on each element of STATES in turn. If any
; of those searches reaches the final state, MULT-DFS returns the complete path
; from the initial state to the goal state. Otherwise, it returns NIL.
(defun mult-dfs (states path)
  NIL)

; MC-DFS does a depth first search from a given state to the goal state. It
; takes two arguments: a state (S) and the path from the initial state to S
; (PATH). If S is the initial state in our search, PATH should be NIL. MC-DFS
; performs a depth-first search starting at the given state. It returns the path
; from the initial state to the goal state, if any, or NIL otherwise. MC-DFS is
; responsible for checking if S is already the goal state, as well as for
; ensuring that the depth-first search does not revisit a node already on the
; search path.
(defun mc-dfs (s path)
  NIL)


; Function execution examples

; Applying this operator would result in an invalid state, with more cannibals
; than missionaries on the east side of the river.
; (next-state '(3 3 t) 1 0) -> NIL

; Applying this operator would result in one cannibal and zero missionaries on
; the west side of the river, which is a legal operator. (note that NEXT-STATE
; returns a LIST of successor states, even when there is only one successor)
; (next-state '(3 3 t) 0 1) -> ((0 1 NIL))

; SUCC-FN returns all of the legal states that can result from applying
; operators to the current state.
; (succ-fn '(3 3 t)) -> ((0 1 NIL) (1 1 NIL) (0 2 NIL))
; (succ-fn '(1 1 t)) -> ((3 2 NIL) (3 3 NIL))

(defun test-mc ()
  (and
    (not (NULL (final-state '(3 3 NIL))))
    (NULL (final-state '(3 2 NIL)))
  )
)
