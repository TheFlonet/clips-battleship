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


; (defrule print-what-i-know-since-the-beginning
; 	(k-cell (x ?x) (y ?y) (content ?t) )
; =>
; 	(printout t "I know that cell [" ?x ", " ?y "] contains " ?t "." crlf)
; )



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

(defrule fill-water-cell-from-ground-truth
	?k-cell <- (k-cell (x ?row) (y ?col) (content water))
	?expcell <- (expected-cell (x ?row) (y ?col))
=>
	; (printout t "fill-water-cell-from-ground-truth" crlf)
	(modify ?expcell (content water))
	(retract ?k-cell)
)

; update k-per for each ship correctly positioned.
(defrule set-ship-part-or-sub-given-k-cell-and-fill-row-if-k-is-one (declare (salience 1))
	?k-cell <- (k-cell (x ?row) (y ?col) (content ?cont & ~water))
	?expcell <- (expected-cell (x ?row) (y ?col))
	?otherrowcells <- (expected-cell (x ?row) (y ?diffcol & ~?col))
	(k-per-row (row ?row) (num ?rownum))
	=>
		; (printout t "set-ship-part-or-sub-given-k-cell-and-fill-row-if-k-is-one" crlf)
		(modify ?expcell (content ?cont))
		(if (eq ?rownum 1) then
		(modify ?otherrowcells (content water)))
)

(defrule set-ship-part-or-sub-given-k-cell-and-fill-col-if-k-is-one (declare (salience 1))
	?k-cell <- (k-cell (x ?row) (y ?col) (content ?cont & ~water))
	?expcell <- (expected-cell (x ?row) (y ?col))
	?othercolcells <- (expected-cell (x ?diffrow & ~?row) (y ?col))
	(k-per-col (col ?col) (num ?colnum))
	=>
		; (printout t "set-ship-part-or-sub-given-k-cell-and-fill-col-if-k-is-one" crlf)
		(modify ?expcell (content ?cont))
		(if (eq ?colnum 1) then
		(modify ?othercolcells (content water)))
)



; 1 - CORNERS - SUBMARINES (UL - UR - DL - DR)

(defrule fill-water-ul-corner-when-sub
	?k-cell <- (k-cell (x 0) (y 0) (content sub))
	?designed <- (k-cell (x 0) (y 0))
	?expcell1 <- (expected-cell (x 0) (y 1))
	?expcell2 <- (expected-cell (x 1) (y 0))
	?expcell3 <- (expected-cell (x 1) (y 1))
=>
	; (printout t "fill-water-ul-corner-when-sub" crlf)
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?designed (content sub))
	(retract ?k-cell)
)

(defrule fill-water-ur-corner-when-sub
	?k-cell <- (k-cell (x 0) (y 9) (content sub))
	?designed <- (k-cell (x 0) (y 9))
	?expcell1 <- (expected-cell (x 0) (y 8))
	?expcell2 <- (expected-cell (x 1) (y 9))
	?expcell3 <- (expected-cell (x 1) (y 8))
=>
	; (printout t "fill-water-ur-corner-when-sub" crlf)
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?designed (content sub))
	(retract ?k-cell)
)

(defrule fill-water-dl-corner-when-sub
	?k-cell <- (k-cell (x 9) (y 0) (content sub))
	?designed <- (k-cell (x 9) (y 0))
	?expcell1 <- (expected-cell (x 9) (y 1))
	?expcell2 <- (expected-cell (x 8) (y 0))
	?expcell3 <- (expected-cell (x 8) (y 1))
=>
	; (printout t "fill-water-dl-corner-when-sub" crlf)
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?designed (content sub))
	(retract ?k-cell)
)

(defrule fill-water-dr-corner-when-sub
	?k-cell <- (k-cell (x 9) (y 9) (content sub))
	?designed <- (k-cell (x 9) (y 9))
	?expcell1 <- (expected-cell (x 9) (y 8))
	?expcell2 <- (expected-cell (x 8) (y 9))
	?expcell3 <- (expected-cell (x 8) (y 8))
=>
	; (printout t "fill-water-dr-corner-when-sub" crlf)
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?designed (content sub))
	(retract ?k-cell)
)

; 2 - CORNERS - LEFT PART OF THE SHIP (UL - DL ONLY)

(defrule fill-water-ul-corner-when-left
	?k-cell <- (k-cell (x 0) (y 0) (content left))
	?designed <- (k-cell (x 0) (y 0))
	?expcell2 <- (expected-cell (x 1) (y 0))
	?expcell3 <- (expected-cell (x 1) (y 1))
	?expcell4 <- (expected-cell (x 1) (y 2))
=>
	; (printout t "fill-water-ul-corner-when-left" crlf)
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?designed (content left))
	(retract ?k-cell)
)

(defrule fill-water-dl-corner-when-left
	?k-cell <- (k-cell (x 9) (y 0) (content left))
	?designed <- (k-cell (x 9) (y 0))
	?expcell2 <- (expected-cell (x 8) (y 0))
	?expcell3 <- (expected-cell (x 8) (y 1))
	?expcell4 <- (expected-cell (x 8) (y 2))
=>
	; (printout t "fill-water-dl-corner-when-left" crlf)
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?designed (content left))
	(retract ?k-cell)
)

; 3 - CORNERS - RIGHT PART OF THE SHIP (UR - DR ONLY)

(defrule fill-water-ur-corner-when-right
	?k-cell <- (k-cell (x 0) (y 9) (content right))
	?designed <- (k-cell (x 0) (y 9))
	?expcell2 <- (expected-cell (x 1) (y 9))
	?expcell3 <- (expected-cell (x 1) (y 8))
	?expcell4 <- (expected-cell (x 1) (y 7))
=>
	; (printout t "fill-water-ur-corner-when-right" crlf)
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?designed (content right))
	(retract ?k-cell)
)

(defrule fill-water-dr-corner-when-right
	?k-cell <- (k-cell (x 9) (y 9) (content right))
	?designed <- (k-cell (x 9) (y 9))
	?expcell2 <- (expected-cell (x 8) (y 9))
	?expcell3 <- (expected-cell (x 8) (y 8))
	?expcell4 <- (expected-cell (x 8) (y 7))
=>
	; (printout t "fill-water-dr-corner-when-right" crlf)
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?designed (content right))
	(retract ?k-cell)
)

; 4 - CORNERS - TOP PART OF THE SHIP (UL - UR ONLY)

(defrule fill-water-ul-corner-when-top
	?k-cell <- (k-cell (x 0) (y 0) (content top))
	?designed <- (k-cell (x 0) (y 0))
	?expcell1 <- (expected-cell (x 0) (y 1))
	?expcell3 <- (expected-cell (x 1) (y 1))
	?expcell4 <- (expected-cell (x 2) (y 1))
=>
	; (printout t "fill-water-ul-corner-when-top" crlf)
	(modify ?expcell1 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?designed (content top))
	(retract ?k-cell)
)

(defrule fill-water-ur-corner-when-top
	?k-cell <- (k-cell (x 0) (y 9) (content top))
	?designed <- (k-cell (x 0) (y 9))
	?expcell1 <- (expected-cell (x 0) (y 8))
	?expcell3 <- (expected-cell (x 1) (y 8))
	?expcell4 <- (expected-cell (x 2) (y 8))
=>
	; (printout t "fill-water-ur-corner-when-top" crlf)
	(modify ?expcell1 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?designed (content top))
	(retract ?k-cell)
)

; 5 - CORNERS - BOTTOM PART OF THE SHIP (DL - DR ONLY)

(defrule fill-water-dl-corner-when-bot
	?k-cell <- (k-cell (x 9) (y 0) (content bot))
	?designed <- (k-cell (x 9) (y 0))
	?expcell1 <- (expected-cell (x 9) (y 1))
	?expcell3 <- (expected-cell (x 8) (y 1))
	?expcell4 <- (expected-cell (x 7) (y 1))
=>
	; (printout t "fill-water-dl-corner-when-bot" crlf)
	(modify ?expcell1 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?designed (content bot))
	(retract ?k-cell)
)

(defrule fill-water-dr-corner-when-bot
	?k-cell <- (k-cell (x 9) (y 9) (content bot))
	?designed <- (k-cell (x 9) (y 9))
	?expcell1 <- (expected-cell (x 9) (y 8))
	?expcell3 <- (expected-cell (x 8) (y 8))
	?expcell4 <- (expected-cell (x 7) (y 8))
=>
	; (printout t "fill-water-dr-corner-when-bot" crlf)
	(modify ?expcell1 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?designed (content bot))
	(retract ?k-cell)
)


; 6 - INTERNAL SLOT - SUBMARINES

(defrule fill-water-internal-slot-when-sub
	?k-cell <- (k-cell (x ?row & ~0 & ~9) (y ?col & ~0 & ~9) (content sub))
	?designed <- (k-cell (x ?row) (y ?col))
	?expcell1 <- (expected-cell (x ?row-1) (y ?col-1))
	?expcell2 <- (expected-cell (x ?row-1) (y ?col))
	?expcell3 <- (expected-cell (x ?row-1) (y ?col+1))
	?expcell4 <- (expected-cell (x ?row) (y ?col-1))
	?expcell5 <- (expected-cell (x ?row) (y ?col+1))
	?expcell6 <- (expected-cell (x ?row+1) (y ?col-1))
	?expcell7 <- (expected-cell (x ?row+1) (y ?col))
	?expcell8 <- (expected-cell (x ?row+1) (y ?col+1))
=>
	; (printout t "fill-water-internal-slot-when-sub" crlf)
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?expcell5 (content water))
	(modify ?expcell6 (content water))
	(modify ?expcell7 (content water))
	(modify ?expcell8 (content water))
	(modify ?designed (content sub))
	(retract ?k-cell)
)

; 7 - INTERNAL SLOT - MIDDLE 

(defrule fill-water-internal-slot-when-middle
	?k-cell <- (k-cell (x ?row & ~0 & ~9) (y ?col & ~0 & ~9) (content middle))
	?designed <- (k-cell (x ?row) (y ?col))
	?expcell1 <- (expected-cell (x ?row-1) (y ?col-1))
	?expcell3 <- (expected-cell (x ?row-1) (y ?col+1))
	?expcell6 <- (expected-cell (x ?row+1) (y ?col-1))
	?expcell8 <- (expected-cell (x ?row+1) (y ?col+1))
=>
	; (printout t "fill-water-internal-slot-when-middle" crlf)
	(modify ?expcell1 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell6 (content water))
	(modify ?expcell8 (content water))
	(modify ?designed (content middle))
	(retract ?k-cell)
)

; 8 - INTERNAL SLOT - LEFT 

(defrule fill-water-internal-slot-when-left
	?k-cell <- (k-cell (x ?row & ~0 & ~9) (y ?col & ~0 & ~9) (content left))
	?designed <- (k-cell (x ?row) (y ?col))
	?expcell1 <- (expected-cell (x ?row-1) (y ?col-1))
	?expcell2 <- (expected-cell (x ?row-1) (y ?col))
	?expcell3 <- (expected-cell (x ?row-1) (y ?col+1))
	?expcell4 <- (expected-cell (x ?row-1) (y ?col+2))
	?expcell5 <- (expected-cell (x ?row) (y ?col-1))
	?expcell6 <- (expected-cell (x ?row+1) (y ?col-1))
	?expcell7 <- (expected-cell (x ?row+1) (y ?col))
	?expcell8 <- (expected-cell (x ?row+1) (y ?col+1))
	?expcell9 <- (expected-cell (x ?row+1) (y ?col+2))
=>
	; (printout t "fill-water-internal-slot-when-left" crlf)
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?expcell5 (content water))
	(modify ?expcell6 (content water))
	(modify ?expcell7 (content water))
	(modify ?expcell8 (content water))
	(modify ?expcell9 (content water))
	(modify ?designed (content left))
	(retract ?k-cell)
)
; 9 - INTERNAL SLOT - RIGTH 

(defrule fill-water-internal-slot-when-right
	?k-cell <- (k-cell (x ?row & ~0 & ~9) (y ?col & ~0 & ~9) (content right))
	?designed <- (k-cell (x ?row) (y ?col))
	?expcell1 <- (expected-cell (x ?row-1) (y ?col-1))
	?expcell2 <- (expected-cell (x ?row-1) (y ?col))
	?expcell3 <- (expected-cell (x ?row-1) (y ?col+1))
	?expcell4 <- (expected-cell (x ?row-1) (y ?col-2))
	?expcell5 <- (expected-cell (x ?row) (y ?col+1))
	?expcell6 <- (expected-cell (x ?row+1) (y ?col-1))
	?expcell7 <- (expected-cell (x ?row+1) (y ?col))
	?expcell8 <- (expected-cell (x ?row+1) (y ?col+1))
	?expcell9 <- (expected-cell (x ?row+1) (y ?col-2))
=>
	; (printout t "fill-water-internal-slot-when-right" crlf)
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?expcell5 (content water))
	(modify ?expcell6 (content water))
	(modify ?expcell7 (content water))
	(modify ?expcell8 (content water))
	(modify ?expcell9 (content water))
	(modify ?designed (content right))
	(retract ?k-cell)
)
; 10 - INTERNAL SLOT - TOP 

(defrule fill-water-internal-slot-when-top
	?k-cell <- (k-cell (x ?row & ~0 & ~9) (y ?col & ~0 & ~9) (content top))
	?designed <- (k-cell (x ?row) (y ?col))
	?expcell1 <- (expected-cell (x ?row-1) (y ?col-1))
	?expcell2 <- (expected-cell (x ?row-1) (y ?col))
	?expcell3 <- (expected-cell (x ?row-1) (y ?col+1))
	?expcell4 <- (expected-cell (x ?row) (y ?col-1))
	?expcell5 <- (expected-cell (x ?row) (y ?col+1))
	?expcell6 <- (expected-cell (x ?row+1) (y ?col-1))
	?expcell7 <- (expected-cell (x ?row+1) (y ?col+1))
	?expcell8 <- (expected-cell (x ?row+2) (y ?col-1))
	?expcell9 <- (expected-cell (x ?row+2) (y ?col+1))
=>
	; (printout t "fill-water-internal-slot-when-top" crlf)
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?expcell5 (content water))
	(modify ?expcell6 (content water))
	(modify ?expcell7 (content water))
	(modify ?expcell8 (content water))
	(modify ?expcell9 (content water))
	(modify ?designed (content top))
	(retract ?k-cell)
)
; 11 - INTERNAL SLOT - BOTTOM 

(defrule fill-water-internal-slot-when-bot
	?k-cell <- (k-cell (x ?row & ~0 & ~9) (y ?col & ~0 & ~9) (content bot))
	?designed <- (k-cell (x ?row) (y ?col))
	?expcell1 <- (expected-cell (x ?row-1) (y ?col-1))
	?expcell2 <- (expected-cell (x ?row-1) (y ?col+1))
	?expcell3 <- (expected-cell (x ?row) (y ?col-1))
	?expcell4 <- (expected-cell (x ?row) (y ?col+1))
	?expcell5 <- (expected-cell (x ?row+1) (y ?col-1))
	?expcell6 <- (expected-cell (x ?row+1) (y ?col))
	?expcell7 <- (expected-cell (x ?row+1) (y ?col+1))
	?expcell8 <- (expected-cell (x ?row-2) (y ?col-1))
	?expcell9 <- (expected-cell (x ?row-2) (y ?col+1))
=>
	; (printout t "fill-water-internal-slot-when-bot" crlf)
	(modify ?expcell1 (content water))
	(modify ?expcell2 (content water))
	(modify ?expcell3 (content water))
	(modify ?expcell4 (content water))
	(modify ?expcell5 (content water))
	(modify ?expcell6 (content water))
	(modify ?expcell7 (content water))
	(modify ?expcell8 (content water))
	(modify ?expcell9 (content water))
	(modify ?designed (content bot))
	(retract ?k-cell)
)

; rules for placing water if a ground truth boat is in the edges

(defrule fill-water-south-edge
	?k-cell <- (k-cell (x 9) (y ?col &~0 &~9) (content ?cont))
	?expcell <- (expected-cell (x 9) (y ?col))
	?expcell-left <- (expected-cell (x 9) (y ?col-1))
	?expcell-right <- (expected-cell (x 9) (y ?col+1))
	?expcell-up <- (expected-cell (x 8) (y ?col))
	?expcell-up-left <- (expected-cell (x 8) (y ?col-1))
	?expcell-up-two-left <- (expected-cell (x 8) (y ?col-2))
	?expcell-two-up-left <- (expected-cell (x 7) (y ?col-1))
	?expcell-up-right <- (expected-cell (x 8) (y ?col+1))
	?expcell-up-two-right <- (expected-cell (x 8) (y ?col+2))
	?expcell-two-up-right <- (expected-cell (x 7) (y ?col+1))
=>
	; (printout t "fill-water-bottom-edge" crlf)
	(if (eq ?cont left) then
		(modify ?expcell-left (content water))
		(modify ?expcell-up-left (content water))
		(modify ?expcell-up (content water))
		(modify ?expcell-up-right (content water))
		(modify ?expcell-up-two-right (content water))
	else (if (eq ?cont right) then
		(modify ?expcell-right (content water))
		(modify ?expcell-up-right (content water))
		(modify ?expcell-up (content water))
		(modify ?expcell-up-left (content water))
		(modify ?expcell-up-two-left (content water))
	else (if (eq ?cont middle) then
		(modify ?expcell-up-left (content water))
		(modify ?expcell-up (content water))
		(modify ?expcell-up-right (content water))
		(modify ?expcell-up-two-left (content water))
		(modify ?expcell-up-two-right (content water))
	else (if (eq ?cont sub) then
		(modify ?expcell-left (content water))
		(modify ?expcell-up-left (content water))
		(modify ?expcell-up (content water))
		(modify ?expcell-up-right (content water))
		(modify ?expcell-left (content water))
	else (if (eq ?cont bot) then
		(modify ?expcell-left (content water))
		(modify ?expcell-up-left (content water))
		(modify ?expcell-up-right (content water))
		(modify ?expcell-right (content water))
		(modify ?expcell-two-up-left (content water))
		(modify ?expcell-two-up-right (content water))
	)))))
	(modify ?expcell (content ?cont))
	(retract ?k-cell)
)

(defrule fill-water-north-edge
	?k-cell <- (k-cell (x ?x) (y ?y) (content ?cont))
	?expcell <- (expected-cell (x 0) (y ?col &~0 &~9))
	?expcell-left <- (expected-cell (x 0) (y ?col-1))
	?expcell-right <- (expected-cell (x 0) (y ?col+1))
	?expcell-bottom <- (expected-cell (x 1) (y ?col))
	?expcell-bottom-left <- (expected-cell (x 1) (y ?col-1))
	?expcell-bottom-two-left <- (expected-cell (x 1) (y ?col-2))
	?expcell-two-bottom-left <- (expected-cell (x 2) (y ?col-1))
	?expcell-bottom-right <- (expected-cell (x 1) (y ?col+1))
	?expcell-bottom-two-right <- (expected-cell (x 1) (y ?col+2))
	?expcell-two-bottom-right <- (expected-cell (x 2) (y ?col+1))
=>
	; (printout t "fill-water-top-edge" crlf)
	(if (eq ?cont left) then
		(modify ?expcell-left (content water))
		(modify ?expcell-bottom-left (content water))
		(modify ?expcell-bottom (content water))
		(modify ?expcell-bottom-right (content water))
		(modify ?expcell-bottom-two-right (content water))
	else (if (eq ?cont right) then
		(modify ?expcell-right (content water))
		(modify ?expcell-bottom-right (content water))
		(modify ?expcell-bottom (content water))
		(modify ?expcell-bottom-left (content water))
		(modify ?expcell-bottom-two-left (content water))
	else (if (eq ?cont middle) then
		(modify ?expcell-bottom-two-left (content water))
		(modify ?expcell-bottom-left (content water))
		(modify ?expcell-bottom (content water))
		(modify ?expcell-bottom-right (content water))
		(modify ?expcell-bottom-two-right (content water))
	else (if (eq ?cont sub) then
		(modify ?expcell-left (content water))
		(modify ?expcell-bottom-left (content water))
		(modify ?expcell-bottom (content water))
		(modify ?expcell-bottom-right (content water))
		(modify ?expcell-left (content water))
	else (if (eq ?cont top) then
		(modify ?expcell-left (content water))
		(modify ?expcell-bottom-left (content water))
		(modify ?expcell-two-bottom-left (content water))
		(modify ?expcell-two-bottom-right (content water))
		(modify ?expcell-bottom-right (content water))
		(modify ?expcell-right (content water))
	)))))
	(modify ?expcell (content ?cont))
	(retract ?k-cell)
)

(defrule fill-water-west-edge
	?k-cell <- (k-cell (x ?x) (y ?y) (content ?cont))
	?expcell <- (expected-cell (x ?row &~0 &~9) (y 0))
	?expcell-up <- (expected-cell (x ?row-1) (y 0))
	?expcell-up-right <- (expected-cell (x ?row-1) (y 1))
	?expcell-up-two-right <- (expected-cell (x ?row-1) (y 2))
	?expcell-two-up-right <- (expected-cell (x ?row-2) (y 1))
	?expcell-right <- (expected-cell (x ?row) (y 1))
	?expcell-bottom-right <- (expected-cell (x ?row+1) (y 1))
	?expcell-bottom-two-right <- (expected-cell (x ?row+1) (y 2))
	?expcell-two-bottom-right <- (expected-cell (x ?row+2) (y 1))
	?expcell-bottom <- (expected-cell (x ?row+1) (y 0))
=>
	; (printout t "fill-water-left-edge" crlf)
	(if (eq ?cont left) then
		(modify ?expcell-up (content water))
		(modify ?expcell-up-right (content water))
		(modify ?expcell-up-two-right (content water))
		(modify ?expcell-bottom-right (content water))
		(modify ?expcell-bottom-two-right (content water))
		(modify ?expcell-bottom (content water))

	else (if (eq ?cont middle) then
		(modify ?expcell-up-right (content water))
		(modify ?expcell-two-up-right (content water))
		(modify ?expcell-right (content water))
		(modify ?expcell-bottom-right (content water))
		(modify ?expcell-two-bottom-right (content water))
	else (if (eq ?cont sub) then
		(modify ?expcell-up (content water))
		(modify ?expcell-up-right (content water))
		(modify ?expcell-right (content water))
		(modify ?expcell-bottom-right (content water))
		(modify ?expcell-bottom (content water))
	else (if (eq ?cont top) then
		(modify ?expcell-up (content water))
		(modify ?expcell-up-right (content water))
		(modify ?expcell-right (content water))
		(modify ?expcell-bottom-right (content water))
		(modify ?expcell-two-bottom-right (content water))
	else (if (eq ?cont bot) then
		(modify ?expcell-up-right (content water))
		(modify ?expcell-right (content water))
		(modify ?expcell-bottom-right (content water))
		(modify ?expcell-bottom (content water))
		(modify ?expcell-two-up-right (content water))
	)))))
	(modify ?expcell (content ?cont))
	(retract ?k-cell)
)

(defrule fill-water-east-edge
	?k-cell <- (k-cell (x ?x) (y ?y) (content ?cont))
	?expcell <- (expected-cell (x ?row &~0 &~9) (y 9))
	?expcell-up <- (expected-cell (x ?row-1) (y 9))
	?expcell-up-left <- (expected-cell (x ?row-1) (y 8))
	?expcell-up-two-left <- (expected-cell (x ?row-1) (y 7))
	?expcell-two-up-left <- (expected-cell (x ?row-2) (y 8))
	?expcell-left <- (expected-cell (x ?row) (y 8))
	?expcell-bottom-left <- (expected-cell (x ?row+1) (y 8))
	?expcell-two-bottom-left <- (expected-cell (x ?row+2) (y 8))
	?expcell-bottom-two-left <- (expected-cell (x ?row+1) (y 7))
	?expcell-bottom <- (expected-cell (x ?row+1) (y 9))
=>
	; (printout t "fill-water-right-edge" crlf)
	(if (eq ?cont right) then
		(modify ?expcell-up (content water))
		(modify ?expcell-up-left (content water))
		(modify ?expcell-up-two-left (content water))
		(modify ?expcell-bottom-two-left (content water))
		(modify ?expcell-bottom-left (content water))
		(modify ?expcell-bottom (content water))
	else (if (eq ?cont middle) then
		(modify ?expcell-two-up-left (content water))
		(modify ?expcell-up-left (content water))
		(modify ?expcell-left (content water))
		(modify ?expcell-bottom-left (content water))
		(modify ?expcell-two-bottom-left (content water))
	else (if (eq ?cont sub) then
		(modify ?expcell-up (content water))
		(modify ?expcell-up-left (content water))
		(modify ?expcell-left (content water))
		(modify ?expcell-bottom-left (content water))
		(modify ?expcell-bottom (content water))
	else (if (eq ?cont top) then
		(modify ?expcell-up (content water))
		(modify ?expcell-up-left (content water))
		(modify ?expcell-left (content water))
		(modify ?expcell-bottom-left (content water))
		(modify ?expcell-two-bottom-left (content water))
	else (if (eq ?cont bot) then
		(modify ?expcell-two-up-left (content water))
		(modify ?expcell-up-left (content water))
		(modify ?expcell-left (content water))
		(modify ?expcell-bottom-left (content water))
		(modify ?expcell-bottom (content water))
	)))))
	(modify ?expcell (content ?cont))
	(retract ?k-cell)
)


(defrule fill-water-row-when-k-cell-row-is-empty
	(k-per-row (row ?row) (num 0))
	?expcell <- (expected-cell (x ?row) (y ?col) (content blank))
=>
	; (printout t "fill-water-row-when-k-cell-row-is-empty" crlf)
	(modify ?expcell (content water))
)

(defrule fill-water-column-when-k-cell-col-is-empty
	(k-per-col (col ?col) (num 0))
	?expcell <- (expected-cell (x ?row) (y ?col) (content blank))
=>
	; (printout t "fill-water-column-when-k-cell-col-is-empty" crlf)
	(modify ?expcell (content water))
)

(defrule print-what-i-know (declare (salience -100))
	(expected-cell (x ?x) (y ?y) (content ?t) )
=>
	(printout t "I know that cell [" ?x ", " ?y "] contains " ?t "." crlf)
)

; FASE DI GUESS

(deftemplate agent-guess
	(slot x)
	(slot y)
	(slot num)
)

(deftemplate to-guess (slot num))

(deffacts guesses
(agent-guess (x 10) (y 10) (num 0))
(agent-guess (x 10) (y 10) (num 1))
(agent-guess (x 10) (y 10) (num 2))
(agent-guess (x 10) (y 10) (num 3))
(agent-guess (x 10) (y 10) (num 4))
(agent-guess (x 10) (y 10) (num 5))
(agent-guess (x 10) (y 10) (num 6))
(agent-guess (x 10) (y 10) (num 7))
(agent-guess (x 10) (y 10) (num 8))
(agent-guess (x 10) (y 10) (num 9))
(agent-guess (x 10) (y 10) (num 10))
(agent-guess (x 10) (y 10) (num 11))
(agent-guess (x 10) (y 10) (num 12))
(agent-guess (x 10) (y 10) (num 13))
(agent-guess (x 10) (y 10) (num 14))
(agent-guess (x 10) (y 10) (num 15))
(agent-guess (x 10) (y 10) (num 16))
(agent-guess (x 10) (y 10) (num 17))
(agent-guess (x 10) (y 10) (num 18))
(agent-guess (x 10) (y 10) (num 19))
(to-guess (num 0))
)

(defrule guess-known-ship-ends
	?boat-end <- (expected-cell (x ?row) (y ?col) (content ?cont &top|bot|left|right))
	(not (agent-guess (x ?row) (y ?col)))
	?num <- (to-guess (num ?guess-num))
	?curr <- (agent-guess (num ?guess-num))
=> 
	(modify ?curr (x ?row) (y ?col))
	(modify ?num (num (+ 1 ?guess-num)))
)

(defrule guess-left-side-of-known-ship-ends
	?boat-end <- (expected-cell (x ?row) (y ?col) (content ?cont &left))
	(not (agent-guess (x ?row) (y ?col+1)))
	?num <- (to-guess (num ?guess-num))
	?curr <- (agent-guess (num ?guess-num))
=>
	(printout t "fill guess " ?guess-num crlf)
	(modify ?curr (x ?row) (y (+ ?col 1)))
	(modify ?num (num (+ 1 ?guess-num)))
)

; TODO: add rules for right, top e bot

; TODO: add rule similar to guess-parts-at-side-boat-ends for middle pieces

(defrule print-guesses (declare (salience -100))
	(agent-guess (x ?x) (y ?y) (num ?n))
=>
	(printout t "agent-guess(" ?x ", " ?y ") - " ?n crlf)
)

(defrule print-guess-num (declare (salience -100))
	(to-guess (num ?guess-num))
=>
	(printout t "curr to guess " ?guess-num crlf)
)