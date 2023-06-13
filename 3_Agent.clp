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
; TODO: update k-per for each ship correctly positioned.

; 1 - CORNERS - SUBMARINES (UL - UR - DL - DR)

(defrule fill-water-ul-corner-when-sub
	(k-cell (x 0) (y 0) (content sub))
	?expcell1 <- (expected-cell (x 0) (y 1))
	?expcell2 <- (expected-cell (x 1) (y 0))
	?expcell3 <- (expected-cell (x 1) (y 1))
=>
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
)

(defrule fill-water-ur-corner-when-sub
	(k-cell (x 0) (y 9) (content sub))
	?expcell1 <- (expected-cell (x 0) (y 8))
	?expcell2 <- (expected-cell (x 1) (y 9))
	?expcell3 <- (expected-cell (x 1) (y 8))
=>
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
)

(defrule fill-water-dl-corner-when-sub
	(k-cell (x 9) (y 0) (content sub))
	?expcell1 <- (expected-cell (x 9) (y 1))
	?expcell2 <- (expected-cell (x 8) (y 0))
	?expcell3 <- (expected-cell (x 8) (y 1))
=>
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
)

(defrule fill-water-dr-corner-when-sub
	(k-cell (x 9) (y 9) (content sub))
	?expcell1 <- (expected-cell (x 9) (y 8))
	?expcell2 <- (expected-cell (x 8) (y 9))
	?expcell3 <- (expected-cell (x 8) (y 8))
=>
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
)

; 2 - CORNERS - LEFT PART OF THE SHIP (UL - DL ONLY)

(defrule fill-water-ul-corner-when-left
	(k-cell (x 0) (y 0) (content left))
	?expcell2 <- (expected-cell (x 1) (y 0))
	?expcell3 <- (expected-cell (x 1) (y 1))
=>
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
)

(defrule fill-water-dl-corner-when-left
	(k-cell (x 9) (y 0) (content left))
	?expcell2 <- (expected-cell (x 8) (y 0))
	?expcell3 <- (expected-cell (x 8) (y 1))
=>
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
)

; 3 - CORNERS - RIGHT PART OF THE SHIP (UR - DR ONLY)

(defrule fill-water-ur-corner-when-right
	(k-cell (x 0) (y 9) (content right))
	?expcell2 <- (expected-cell (x 1) (y 9))
	?expcell3 <- (expected-cell (x 1) (y 8))
=>
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
)

(defrule fill-water-dr-corner-when-right
	(k-cell (x 9) (y 9) (content right))
	?expcell2 <- (expected-cell (x 8) (y 9))
	?expcell3 <- (expected-cell (x 8) (y 8))
=>
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
)

; 4 - CORNERS - TOP PART OF THE SHIP (UL - UR ONLY)

(defrule fill-water-ul-corner-when-top
	(k-cell (x 0) (y 0) (content top))
	?expcell1 <- (expected-cell (x 0) (y 1))
	?expcell3 <- (expected-cell (x 1) (y 1))
=>
	(modify ?expcell1 (content water))
	(modify ?expcell3 (content water))
)

(defrule fill-water-ur-corner-when-top
	(k-cell (x 0) (y 9) (content top))
	?expcell1 <- (expected-cell (x 0) (y 8))
	?expcell3 <- (expected-cell (x 1) (y 8))
=>
	(modify ?expcell1 (content water))
	(modify ?expcell3 (content water))
)

; 5 - CORNERS - BOTTOM PART OF THE SHIP (DL - DR ONLY)

(defrule fill-water-dl-corner-when-bot
	(k-cell (x 9) (y 0) (content bot))
	?expcell1 <- (expected-cell (x 9) (y 1))
	?expcell3 <- (expected-cell (x 8) (y 1))
=>
	(modify ?expcell1 (content water))
	(modify ?expcell3 (content water))
)

(defrule fill-water-dr-corner-when-bot
	(k-cell (x 9) (y 9) (content bot))
	?expcell1 <- (expected-cell (x 9) (y 8))
	?expcell3 <- (expected-cell (x 8) (y 8))
=>
	(modify ?expcell1 (content water))
	(modify ?expcell3 (content water))
)


; 6 - INTERNAL SLOT - SUBMARINES

(defrule fill-water-internal-slot-when-sub
	(k-cell (x ?row & ~0 & ~9) (y ?col & ~0 & ~9) (content sub))
	?expcell1 <- (expected-cell (x ?row-1) (y ?col-1))
	?expcell2 <- (expected-cell (x ?row-1) (y ?col))
	?expcell3 <- (expected-cell (x ?row-1) (y ?col+1))
	?expcell4 <- (expected-cell (x ?row) (y ?col-1))
	?expcell5 <- (expected-cell (x ?row) (y ?col+1))
	?expcell6 <- (expected-cell (x ?row+1) (y ?col-1))
	?expcell7 <- (expected-cell (x ?row+1) (y ?col))
	?expcell8 <- (expected-cell (x ?row+1) (y ?col+1))
=>
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?expcell5 (content water))
	(modify ?expcell6 (content water))
	(modify ?expcell7 (content water))
	(modify ?expcell8 (content water))
)

; 7 - INTERNAL SLOT - MIDDLE 

(defrule fill-water-internal-slot-when-middle
	(k-cell (x ?row & ~0 & ~9) (y ?col & ~0 & ~9) (content middle))
	?expcell1 <- (expected-cell (x ?row-1) (y ?col-1))
	?expcell3 <- (expected-cell (x ?row-1) (y ?col+1))
	?expcell6 <- (expected-cell (x ?row+1) (y ?col-1))
	?expcell8 <- (expected-cell (x ?row+1) (y ?col+1))
=>
	(modify ?expcell1 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell6 (content water))
	(modify ?expcell8 (content water))
)

; 8 - INTERNAL SLOT - LEFT 

(defrule fill-water-internal-slot-when-left
	(k-cell (x ?row & ~0 & ~9) (y ?col & ~0 & ~9) (content left))
	?expcell1 <- (expected-cell (x ?row-1) (y ?col-1))
	?expcell2 <- (expected-cell (x ?row-1) (y ?col))
	?expcell3 <- (expected-cell (x ?row-1) (y ?col+1))
	?expcell4 <- (expected-cell (x ?row) (y ?col-1))
	?expcell6 <- (expected-cell (x ?row+1) (y ?col-1))
	?expcell7 <- (expected-cell (x ?row+1) (y ?col))
	?expcell8 <- (expected-cell (x ?row+1) (y ?col+1))
=>
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?expcell6 (content water))
	(modify ?expcell7 (content water))
	(modify ?expcell8 (content water))
)
; 9 - INTERNAL SLOT - RIGTH 

(defrule fill-water-internal-slot-when-right
	(k-cell (x ?row & ~0 & ~9) (y ?col & ~0 & ~9) (content right))
	?expcell1 <- (expected-cell (x ?row-1) (y ?col-1))
	?expcell2 <- (expected-cell (x ?row-1) (y ?col))
	?expcell3 <- (expected-cell (x ?row-1) (y ?col+1))
	?expcell5 <- (expected-cell (x ?row) (y ?col+1))
	?expcell6 <- (expected-cell (x ?row+1) (y ?col-1))
	?expcell7 <- (expected-cell (x ?row+1) (y ?col))
	?expcell8 <- (expected-cell (x ?row+1) (y ?col+1))
=>
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell5 (content water))
	(modify ?expcell6 (content water))
	(modify ?expcell7 (content water))
	(modify ?expcell8 (content water))
)
; 10 - INTERNAL SLOT - TOP 

(defrule fill-water-internal-slot-when-top
	(k-cell (x ?row & ~0 & ~9) (y ?col & ~0 & ~9) (content top))
	?expcell1 <- (expected-cell (x ?row-1) (y ?col-1))
	?expcell2 <- (expected-cell (x ?row-1) (y ?col))
	?expcell3 <- (expected-cell (x ?row-1) (y ?col+1))
	?expcell4 <- (expected-cell (x ?row) (y ?col-1))
	?expcell5 <- (expected-cell (x ?row) (y ?col+1))
	?expcell6 <- (expected-cell (x ?row+1) (y ?col-1))
	?expcell8 <- (expected-cell (x ?row+1) (y ?col+1))
=>
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?expcell5 (content water))
	(modify ?expcell6 (content water))
	(modify ?expcell8 (content water))
)
; 11 - INTERNAL SLOT - BOTTOM 

(defrule fill-water-internal-slot-when-bot
	(k-cell (x ?row & ~0 & ~9) (y ?col & ~0 & ~9) (content bot))
	?expcell1 <- (expected-cell (x ?row-1) (y ?col-1))
	?expcell3 <- (expected-cell (x ?row-1) (y ?col+1))
	?expcell4 <- (expected-cell (x ?row) (y ?col-1))
	?expcell5 <- (expected-cell (x ?row) (y ?col+1))
	?expcell6 <- (expected-cell (x ?row+1) (y ?col-1))
	?expcell7 <- (expected-cell (x ?row+1) (y ?col))
	?expcell8 <- (expected-cell (x ?row+1) (y ?col+1))
=>
	(modify ?expcell1 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?expcell5 (content water))
	(modify ?expcell6 (content water))
	(modify ?expcell7 (content water))
	(modify ?expcell8 (content water))
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

