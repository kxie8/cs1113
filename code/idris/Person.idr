module Person
import list
import bool
import nat

||| A record type that is equivalent to:
||| (data Person = mkPerson String nat)
||| but where we give names to fields.
||| A person has a name, age in
||| years, height in inches, and gender(true=female).
record Person where
    constructor MkPerson
    name : String
    age : Nat
    height: Nat
    gender: bool

-- And now here's the key idea: The 
-- names of the fields are automatically
-- names of projection functions! Here
-- we get out the age of person, p.
p: Person
p = MkPerson "tommy" 3 4 false

t: Nat
t = age p
-- expect 3

-- Here we get the name of person p.
n: String
n = name p
-- expect "Tommy"

--field override functions (is the same as 
--setName: Person -> String -> Person
--setName (MkPerson n a h g) n' = MkPerson n' a h g
setName: Person -> String -> Person
setName p n = record { name = n } p
--setName Person "newname" = change name in record into "newname" for Person




|||give a list and a predicate on elements return sublist of elements for which the predicate is true
filter: (a -> bool) -> list a -> list a
filter f nil = nil
filter f (h::t) = ite (f h) --IF (BOOL)
                      (h::(filter f t)) --THEN
                          (filter f t) --ELSE
       --filter takes a predicate of type a and a list of a, return a list of a which sublist is true?



 
