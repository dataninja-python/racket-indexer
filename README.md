dir-indexer
===========
README text here.
# racket-indexer

(define hello "yo")
(define a (+ 3 4))
(define (avg x y)
    (quotient (+ x y) 
        2
    )
)

;; racket if

;; (if <predicate> <consequent> <alternative>)
Example:

(define (warm temp)
    (if (> temp 75)
        "warm"
        "cold"
    )
)


;; multiple ifs together use cond
(cond 
    [<test1> <result>] 
    [<test2> <result>] 
    [else <result>]
)


(define (cool temp)
    (cond
        [(> temp 75) "hot"]
        [(< temp 65) "cold"]
        [else "warm"]
    )
)

(let
    (
        [<variable1> <value1>]
        [<variable2> <value2>]
    )
    <body>
)

;; example
(define (spam)
    (let    (  
                [a 3]
                [b 4]
            )
        (+ a b)
    )
)
