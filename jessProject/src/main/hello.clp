(printout t "Hello, World" crlf)
(printout t "The answer is " (+ 2 3) "!" crlf)
(bind ?x "The value")
(printout t ?x crlf)

(deftemplate automobile
    "A specific car."
    (slot make)
    (slot model)
    (slot year (type INTEGER))
    (slot color (default white)))

(reset)

(assert (automobile (model LeBaron) (make Chrysler)
        (year 1997)))


(deftemplate account
    (declare (from-class main.Account)
        ))

(assert (account (balance 2000)))



(bind ?a (new main.Account))
(add ?a)


(deftemplate person (slot firstName) (slot lastName) (slot age))
/*(person (age ?a) (firstName ?f) (lastName ?l))*/


(watch all)


(assert (person (firstName Jan) (lastName Hradek)(age 35)))
(assert (person (firstName Martin) (lastName Kozeny)(age 25)))
(assert (person (firstName Michal) (lastName Janousek)(age 25)))

(facts)

(defrule welcome-toddlers
    "Give a special greeting to young children"
    ?p <- (person {age < 30})
    =>
    (printout t "Hello, little one "?p.firstName"!" crlf))

(defrule teenager
    ?p <- (person {age > 12 && age < 30} (firstName ?name))
    =>
    (printout t ?name " is " ?p.age " years old teenager." crlf))


(defrule two-same-age-different-name
    ?person1 <- (person)
    ?person2 <- (person {age == person1.age &&lastName != person1.lastName})
    =>(printout t "Found two different " ?person1.age "-year-old people-" ?person1.firstName ", " ?person2.firstName "." crlf))


(defrule wrong-rule
    (eq 1 1)
    =>
    (printout t "Just as I thought,
1 == 1!" crlf))

(run)

/*( welcome-toddlers)*/



(defquery search-by-name
    "Finds people with a given last name"
    (declare (variables ?ln))
    (person (lastName ?ln) (firstName ?fn) (age ?age)))


(deffacts data
    (person (firstName Fred) (lastName Smith) (age 12))
    (person (firstName Fred) (lastName  Jones)(age 9))
    (person (firstName Bob) (lastName  Thomas)(age 32))
    (person (firstName Bob) (lastName Smith)(age 22))
    (person (firstName Pete)(lastName  Best)(age 21))
    (person (firstName Pete) (lastName Smith)(age 44))
    (person (firstName George)(lastName Smithson)(age 1))
    )


(reset)

(bind ?result (run-query* search-by-name Smith))


(while (?result next)
(printout t (?result getString fn) " " (?result getString ln)
", age " (?result getInt age) crlf))
