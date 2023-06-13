;  ---------------------------------------------
;  --- Definizione del modulo e dei template ---
;  ---------------------------------------------
(defmodule AGENT (import MAIN ?ALL) (import ENV ?ALL) (export ?ALL))




; (defrule inerzia0 (declare (salience 10))
; 	(status (step ?s)(currently running))
; 	(moves (fires 0) (guesses ?ng&:(> ?ng 0)))
; =>
; 	(assert (exec (step ?s) (action guess) (x 0) (y 0)))
;      (pop-focus)

; )

; (defrule inerzia0-bis (declare (salience 10))
; 	(status (step ?s)(currently running))
; 	(moves (guesses 0))
; =>
; 	(assert (exec (step ?s) (action unguess) (x 0) (y 0)))
;      (pop-focus)

; )



; (defrule inerzia
; 	(status (step ?s)(currently running))
; 	(not (exec  (action fire) (x 2) (y 4)) )
; =>
; 	(assert (exec (step ?s) (action fire) (x 2) (y 4)))
;      (pop-focus)

; )

; (defrule inerzia1
; 	(status (step ?s)(currently running))
; 	(not (exec  (action fire) (x 2) (y 5)))
; =>


; 	(assert (exec (step ?s) (action fire) (x 2) (y 5)))
;      (pop-focus)

; )

; (defrule inerzia2
; 	(status (step ?s)(currently running))
; 	(not (exec  (action fire) (x 2) (y 6)))

; =>

; 	(assert (exec (step ?s) (action fire) (x 2) (y 6)))
;      (pop-focus)

; )

; (defrule inerzia3
; 	(status (step ?s)(currently running))
; 	(not (exec  (action fire) (x 1) (y 2)))

; =>
; 	(assert (exec (step ?s) (action fire) (x 1) (y 2)))
;      (pop-focus)
; )


; (defrule inerzia4
; 	(status (step ?s)(currently running))
; 	(not (exec (action fire) (x 7) (y 5)))
; =>

; 	(assert (exec (step ?s) (action fire) (x 7) (y 5)))
;      (pop-focus)



; )

; (defrule inerzia5
; 	(status (step ?s)(currently running))

; 	(not (exec (action fire) (x 8) (y 3)))
; =>



; 	(assert (exec (step ?s) (action fire) (x 8) (y 3)))
;      (pop-focus)


; )


; (defrule inerzia6
; 	(status (step ?s)(currently running))
; 		(not (exec  (action fire) (x 8) (y 4)))
; =>


; 	(assert (exec (step ?s) (action fire) (x 8) (y 4)))
;      (pop-focus)

; 	)





; (defrule inerzia7
; 	(status (step ?s)(currently running))
; 		(not (exec  (action fire) (x 8) (y 5)))
; =>


; 	(assert (exec (step ?s) (action fire) (x 8) (y 5)))
;      (pop-focus)

; )


; (defrule inerzia8
; 	(status (step ?s)(currently running))
; 		(not (exec  (action fire) (x 6) (y 9)))
; =>


; 	(assert (exec (step ?s) (action fire) (x 6) (y 9)))
;      (pop-focus)
; )


; (defrule inerzia9
; 	(status (step ?s)(currently running))
; 		(not (exec  (action fire) (x 7) (y 9)))
; =>


; 	(assert (exec (step ?s) (action fire) (x 7) (y 9)))
;      (pop-focus)
; )

; (defrule inerzia10 (declare (salience 30))
; 	(status (step ?s)(currently running))
; 		(not (exec  (action fire) (x 6) (y 4)))
; =>


; 	(assert (exec (step ?s) (action fire) (x 6) (y 4)))
;      (pop-focus)
; )

; (defrule inerzia11 (declare (salience 30))
; 	(status (step ?s)(currently running))
; 		(not (exec  (action guess) (x 7) (y 7)))
; =>


; 	(assert (exec (step ?s) (action guess) (x 7) (y 7)))
;      (pop-focus)
; )


; (defrule inerzia20 (declare (salience 30))
; 	(status (step ?s)(currently running))
; 	(not (exec  (action guess) (x 1) (y 3)))
; =>


; 	(assert (exec (step ?s) (action guess) (x 1) (y 3)))
;      (pop-focus)

; )

; (defrule inerzia21  (declare (salience 30))
; 	(status (step ?s)(currently running))
; 	(not (exec  (action guess) (x 1) (y 4)))
; =>


; 	(assert (exec (step ?s) (action guess) (x 1) (y 4)))
;      (pop-focus)

; )


(defrule print-what-i-know-since-the-beginning
	(k-cell (x ?x) (y ?y) (content ?t) )
=>
	(printout t "I know that cell [" ?x ", " ?y "] contains " ?t "." crlf)
)



(deftemplate expected-cell 
	(slot x)
	(slot y)
	(slot content (allowed-values blank water left right middle top bot sub))
)

(deffacts guessed-board
(expected-cell (x 0) (y 0) (content blank))
(expected-cell (x 0) (y 1) (content blank))
(expected-cell (x 0) (y 2) (content blank))
(expected-cell (x 0) (y 3) (content blank))
(expected-cell (x 0) (y 4) (content blank))
(expected-cell (x 0) (y 5) (content blank))
(expected-cell (x 0) (y 6) (content blank))
(expected-cell (x 0) (y 7) (content blank))
(expected-cell (x 0) (y 8) (content blank))
(expected-cell (x 0) (y 9) (content blank))
(expected-cell (x 1) (y 0) (content blank))
(expected-cell (x 1) (y 1) (content blank))
(expected-cell (x 1) (y 2) (content blank))
(expected-cell (x 1) (y 3) (content blank))
(expected-cell (x 1) (y 4) (content blank))
(expected-cell (x 1) (y 5) (content blank))
(expected-cell (x 1) (y 6) (content blank))
(expected-cell (x 1) (y 7) (content blank))
(expected-cell (x 1) (y 8) (content blank))
(expected-cell (x 1) (y 9) (content blank))
(expected-cell (x 2) (y 0) (content blank))
(expected-cell (x 2) (y 1) (content blank))
(expected-cell (x 2) (y 2) (content blank))
(expected-cell (x 2) (y 3) (content blank))
(expected-cell (x 2) (y 4) (content blank))
(expected-cell (x 2) (y 5) (content blank))
(expected-cell (x 2) (y 6) (content blank))
(expected-cell (x 2) (y 7) (content blank))
(expected-cell (x 2) (y 8) (content blank))
(expected-cell (x 2) (y 9) (content blank))
(expected-cell (x 3) (y 0) (content blank))
(expected-cell (x 3) (y 1) (content blank))
(expected-cell (x 3) (y 2) (content blank))
(expected-cell (x 3) (y 3) (content blank))
(expected-cell (x 3) (y 4) (content blank))
(expected-cell (x 3) (y 5) (content blank))
(expected-cell (x 3) (y 6) (content blank))
(expected-cell (x 3) (y 7) (content blank))
(expected-cell (x 3) (y 8) (content blank))
(expected-cell (x 3) (y 9) (content blank))
(expected-cell (x 4) (y 0) (content blank))
(expected-cell (x 4) (y 1) (content blank))
(expected-cell (x 4) (y 2) (content blank))
(expected-cell (x 4) (y 3) (content blank))
(expected-cell (x 4) (y 4) (content blank))
(expected-cell (x 4) (y 5) (content blank))
(expected-cell (x 4) (y 6) (content blank))
(expected-cell (x 4) (y 7) (content blank))
(expected-cell (x 4) (y 8) (content blank))
(expected-cell (x 4) (y 9) (content blank))
(expected-cell (x 5) (y 0) (content blank))
(expected-cell (x 5) (y 1) (content blank))
(expected-cell (x 5) (y 2) (content blank))
(expected-cell (x 5) (y 3) (content blank))
(expected-cell (x 5) (y 4) (content blank))
(expected-cell (x 5) (y 5) (content blank))
(expected-cell (x 5) (y 6) (content blank))
(expected-cell (x 5) (y 7) (content blank))
(expected-cell (x 5) (y 8) (content blank))
(expected-cell (x 5) (y 9) (content blank))
(expected-cell (x 6) (y 0) (content blank))
(expected-cell (x 6) (y 1) (content blank))
(expected-cell (x 6) (y 2) (content blank))
(expected-cell (x 6) (y 3) (content blank))
(expected-cell (x 6) (y 4) (content blank))
(expected-cell (x 6) (y 5) (content blank))
(expected-cell (x 6) (y 6) (content blank))
(expected-cell (x 6) (y 7) (content blank))
(expected-cell (x 6) (y 8) (content blank))
(expected-cell (x 6) (y 9) (content blank))
(expected-cell (x 7) (y 0) (content blank))
(expected-cell (x 7) (y 1) (content blank))
(expected-cell (x 7) (y 2) (content blank))
(expected-cell (x 7) (y 3) (content blank))
(expected-cell (x 7) (y 4) (content blank))
(expected-cell (x 7) (y 5) (content blank))
(expected-cell (x 7) (y 6) (content blank))
(expected-cell (x 7) (y 7) (content blank))
(expected-cell (x 7) (y 8) (content blank))
(expected-cell (x 7) (y 9) (content blank))
(expected-cell (x 8) (y 0) (content blank))
(expected-cell (x 8) (y 1) (content blank))
(expected-cell (x 8) (y 2) (content blank))
(expected-cell (x 8) (y 3) (content blank))
(expected-cell (x 8) (y 4) (content blank))
(expected-cell (x 8) (y 5) (content blank))
(expected-cell (x 8) (y 6) (content blank))
(expected-cell (x 8) (y 7) (content blank))
(expected-cell (x 8) (y 8) (content blank))
(expected-cell (x 8) (y 9) (content blank))
(expected-cell (x 9) (y 0) (content blank))
(expected-cell (x 9) (y 1) (content blank))
(expected-cell (x 9) (y 2) (content blank))
(expected-cell (x 9) (y 3) (content blank))
(expected-cell (x 9) (y 4) (content blank))
(expected-cell (x 9) (y 5) (content blank))
(expected-cell (x 9) (y 6) (content blank))
(expected-cell (x 9) (y 7) (content blank))
(expected-cell (x 9) (y 8) (content blank))
(expected-cell (x 9) (y 9) (content blank))
)

(defrule fill-cell-from-ground-truth
	(k-cell (x ?row) (y ?col) (content ?cont))
	?expcell <- (expected-cell (x ?row) (y ?col) (content ~?cont))
=>
	(modify ?expcell (content ?cont))
)


(defrule fill-water-row-when-k-cell-row-is-empty
	(k-per-row (row ?row) (num 0))
	?expcell <- (expected-cell (x ?row) (y ?col) (content ~water))
=>
	(modify ?expcell (content water))
)

(defrule fill-water-column-when-k-cell-col-is-empty
	(k-per-col (col ?col) (num 0))
	?expcell <- (expected-cell (x ?row) (y ?col) (content ~water))
=>
	(modify ?expcell (content water))
)

