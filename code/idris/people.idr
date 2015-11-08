module people
import Person
import bool
import nat
import list

-- An example value of type Person
tommy: Person
tommy = MkPerson "Tommy" 18 72 false

--mary
mary: Person
mary = MkPerson "Mary" 12 68 true

--record style
getAge: Person -> Nat
getAge = age

getName: Person -> String
getName = name

getHeight: Person -> Nat
getHeight (MkPerson name age height gender)= height

people: list Person
people = tommy::mary::nil


--field override functions (is the same as 
--setName: Person -> String -> Person
--setName (MkPerson n a h g) n' = MkPerson n' a h g
setName: Person -> String -> Person
setName p n = record { name = n } p
--setName Person "newname" = change name in record into "newname" for Person

--specialized map, given person list age
mapAge: list Person -> list Nat
mapAge nil = nil
mapAge (h::t) = (age h)::(mapAge t)

ages: list Nat
ages = mapAge people


ages': list Nat
ages' = map age people

--test case for filter
filter': (nat -> bool) -> list nat -> list nat
filter' evenb nil = nil
filter' evenb (h::t) = ite (evenb h) (h::(filter'  evenb t)) (filter' evenb t)
 
