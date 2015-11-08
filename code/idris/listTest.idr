module listTest
import Person
import list
import nat
import serialize
-- import pair
 import bool
-- import option

--data list q = nil | cons q (list q)

--:: goes between arguements and is right associative. ++ is append

--test case for map
map': (nat -> bool) -> list  nat -> list bool
map' evenb nil = nil
map' evenb (h::t) = (evenb h)::(map' evenb t)

--test case for filter
filter': (nat -> bool) -> list nat -> list nat
filter' evenb nil = nil
filter' evenb (h::t) = ite (evenb h) (h::(filter'  evenb t)) (filter' evenb t)



--|||short hand for lists
--l1': list' Nat
--l1' = (0::nil')
--l2': list' Nat
--l2' = (1::2::nil')
--l3': list' Nat
--l3' = (1::2::nil')






