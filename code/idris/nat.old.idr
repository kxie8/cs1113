module nat.old
import boolTest
import pair
import bool
import nat


-- zero
z: nat
z = O

-- one
o: nat
o = S O

-- two
t: nat
t = S (S O)

-- three
r: nat
r = S t

-- four
four: nat
four = S r

-- five
five: nat
five = S four

-- HOMEWORK #7 Bind x to the result of applying isZero to r. Add your
-- code below this comment.

x: bool
x = isZero r

||| returns the successor of any given nat
succ: nat -> nat
succ n = S n

-- HOMEWORK #8 Bind y to the result of applying succ to O. Add code here.

y: nat
y = succ O



-- HOMEWORK #9 Bind a, b, c, d, e respectively to the results of
-- applying evenb to O, (S O), (S (S O)), r, and (S r),
-- respectively. Add your code here.

a: bool
a = evenb O

b: bool
b = evenb (S O)

c: bool
c = evenb (S (S O))

d: bool
d = evenb r

e: bool
e = evenb (S r)


||| given a pair of natural numbers, return its sum
addp: pair nat nat -> nat
addp (mkPair O m) = m
addp (mkPair (S n) m) = S (addp (mkPair n m))
addp (mkPair (S n) m) = addp (mkPair n (S m))

||| a test, expecting O
h1: nat
h1 = addp (mkPair O O)

||| a test, expecting S (S O)
h2: nat
h2 = addp (mkPair O (S (S O)))

||| a test, expecting (S O)
h3: nat
h3 = addp (mkPair (S O) O)

||| a test, expecting (S (S (S (S (S O)))))
h4: nat
h4 = addp (mkPair (S (S O)) (S (S (S O))))

||| given a pair of natural numbers, return its product
multp: pair nat nat -> nat
multp (mkPair O m) = O
multp (mkPair (S n) m) = addp (mkPair (multp (mkPair n m)) m)

||| factorial
factp: nat -> nat
factp O = (S O)
factp (S n) = (multp (mkPair (S n) (factp (n))))

subp: pair nat nat -> nat
subp (mkPair O m) = O
subp (mkPair n O) = n
subp (mkPair (S n) (S m)) = subp (mkPair n m)

--#5: exp - given a pair of natural numbers, (x, n), return the value of x raised to the nth power
expp: pair nat nat -> nat
expp (mkPair n O) = (S O)
expp (mkPair O m) = O
expp (mkPair n (S m)) = multp (mkPair n (expp (mkPair n m)))

--#6: lep -- given a pair of natural numbers, (a, b), return true if a is less than or equal to b, otherwise return false
lep: pair nat nat -> bool
lep (mkPair O m) = true
lep (mkPair (S n) O) = false
lep (mkPair (S n) (S m)) = lep (mkPair n m)

--#7: eqp -- given a pair of natural numbers, (a, b), return true if a
  --is equal to b, otherwise return false NOTE I used absolute value
    --rather than a recursive definition. 
eqpp: pair nat nat -> bool
eqpp (mkPair O O) = true
eqpp (mkPair _ _) = false
eqpp (mkPair (S n) (S m)) = eqpp (mkPair n m)
--eqpp (mkPair a b) = andp (mkPair (isZero (subp (mkPair a b))) (isZero (subp (mkPair b a))))

--#8: gtp -- given a pair of natural numbers, (a, b), return true if a is greater than b, otherwise return false
gtp: pair nat nat -> bool
gtp (mkPair O m) = false
gtp (mkPair n O) = true
gtp (mkPair (S n) (S m)) = gtp (mkPair n m)
--gtp (mkPair a b) = not (isZero (subp (mkPair a b)))

--#9: gep -- given a pair of natural numbers, (a, b), return true of a is greater than or equal to b
gep: pair nat nat -> bool
gep (mkPair n O) = true
gep (mkPair O m) = false
gep (mkPair (S n) (S m)) = gep (mkPair n m)
--gep (mkPair a b) = orp (mkPair (eqp (mkPair a b)) (gtp (mkPair a b)))

--#10: ltp -- given a pair of natural numbers, (a, b), return true if
  --a is less than b
ltp: pair nat nat -> bool
ltp (mkPair n O) = false
ltp (mkPair O m) = true
ltp (mkPair (S n) (S m)) = ltp (mkPair n m)
--ltp (mkPair a b) = not (gep (mkPair a b))

|||give a natural number
fibp: nat -> nat
fibp O = O
fibp (S O) = (S O)
fibp (S(S x)) = addp (mkPair (fibp (S x)) (fibp(x)))
 
