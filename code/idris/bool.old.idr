module bool.old
import bool
import pair

b1: bool
b1 = true

b2: bool
b2 = true

b3: bool
b3 = false

b4: bool
b4 = not true

b5: bool
b5 = not b1

b6: bool
b6 =  not(not b5)

andp: pair bool bool -> bool
andp (mkPair true true) = true
andp (mkPair a b) = false

orp: pair bool bool -> bool
orp (mkPair false false) = false
orp (mkPair a b) = true

nandp: pair bool bool -> bool
nandp (mkPair a b) = not (andp (mkPair a b))

xorp: pair bool bool -> bool
xorp (mkPair true false) = true
xorp (mkPair false true) = true
xorp (mkPair a b) = false

pand: bool -> bool -> bool
--pand true b = id b
--pand false b = constFalse b
pand true = bool.id
pand false = constFalse

por: bool -> bool -> bool
--por true b = constTrue b
--por false b = id b
por true = constTrue
por false = bool.id

pxor: bool -> bool -> bool
--pxor true b = not(id b)
--pxor false b = id b
pxor true = not
pxor false = bool.id

pnand: bool -> bool -> bool
--pnand true b = not(id b)
--pnand false b = constTrue b
pnand true = not
pnand false = constTrue
