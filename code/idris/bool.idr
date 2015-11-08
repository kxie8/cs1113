-- total functions
-- block comments
-- symbolic arguments
-- pattern matching: any argument

module bool
import serialize
data bool = true | false

id: bool -> bool
id b = b

constFalse: bool -> bool
constFalse _ = false

constTrue: bool -> bool
constTrue _ = true

not: bool -> bool
not true = false
not _ = true

--Exam Problem #2: There are 16 possible ways to fill in the result column for a truth table for a binary Boolean function, and there are thus exactly 16 such functions, and no more


--partial
and: bool -> bool -> bool
and true true = true
and _ _ = false

uf: bool -> bool
uf = (and true)

or: bool -> bool -> bool
or false false = false
or _ _ = true

nand: bool -> bool -> bool
nand a b = not (and a b)

xor: bool -> bool -> bool
xor true false = true
xor false true = true
xor a b = false

eql_bool: bool -> bool -> bool
eql_bool true true = true
eql_bool false false = true
eql_bool _ _ = false

instance serialize bool where
  toString true = "True"
  toString false = "False"
