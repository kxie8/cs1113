module natTest
import boolTest
import pair
import bool
import nat
import serialize


||| factorial
fact: nat -> nat
fact O = (S O)
fact (S n) = mult (S n) (fact n)

--subtraction
sub: nat -> nat -> nat
sub O m = O
sub n O = n
sub (S n) (S m) = sub n m

--#5: exp - given a pair of natural numbers, (x, n), return the value of x raised to the nth power
exp: nat -> nat -> nat
exp n O = (S O)
exp O m = O
exp n (S m) = mult n (exp n m)

--#6: lep -- given a pair of natural numbers, (a, b), return true if a is less than or equal to b, otherwise return false
leq: nat -> nat -> bool
leq O m = true
leq (S n) O = false
leq (S n) (S m) = leq n m

--#7: eqp -- given a pair of natural numbers, (a, b), return true if a
  --is equal to b, otherwise return false NOTE I used absolute value
eq: nat -> nat -> bool
eq O O = true
eq _ _ = false
eq (S n) (S m) = eq n m

--#8: gtp -- given a pair of natural numbers, (a, b), return true if a is greater than b, otherwise return false
gt: nat -> nat -> bool
gt O m = false
gt n O = true
gt (S n) (S m) = gt n m


--#9: gep -- given a pair of natural numbers, (a, b), return true of a is greater than or equal to b
geq: nat -> nat -> bool
geq n O = true
geq O m = false
geq (S n) (S m) = geq n m


--#10: ltp -- given a pair of natural numbers, (a, b), return true if
  --a is less than b
lt: nat -> nat -> bool
lt n O = false
lt O m = true
lt (S n) (S m) = lt n m

|||give a natural number
fib: nat -> nat
fib O = O
fib (S O) = (S O)
fib (S(S n)) = add (fib (S n)) (fib n)

s: String
s = toString (S O)
