module nat
import bool
import pair
import eq
import serialize

||| A data type to represent the natural numbers.  We use a lower case
||| "n" in the name to distinguish our nat type from Idris's Nat type

data nat = O | S nat


||| returns true if the argument is (represents) zero, otherwise false
isZero: nat -> bool
isZero O = true
isZero _ = false


||| returns the predecessor of any given nat
pred: nat -> nat
pred O = O
pred (S n) = n


||| return true if the argument is even otherwise false
evenb: nat -> bool
evenb O = true
evenb (S O) = false
evenb (S (S n)) = evenb n

oddb: nat -> bool
oddb x = not (evenb x)


add: nat -> nat -> nat
add O m = m
add (S n) m = S(add m n)


pf: nat -> nat
pf = add(S(S O))


||| given a pair of natural numbers, return its product
mult: nat -> nat -> nat
mult O m = O
mult (S n) m = add m (mult n m)

eql_nat: nat -> nat -> bool
eql_nat O O = true
eql_nat (S n) O = false
eql_nat O (S m) = false
eql_nat (S n) (S m) = eql_nat n m

instance eq nat where
  eql n1 n2 = eql_nat n1 n2

instance serialize nat where
   toString O = "z"
   toString (S n) = "s" ++ (toString n)
