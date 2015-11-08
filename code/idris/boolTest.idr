module boolTest
import bool
import pair
import serialize


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

s: String
s = toString true

