module list.old
import list
import nat
import pair
import listTest

data list_nat = nil | cons nat list_nat

l0: list_nat
l0 = nil

l1: list_nat
l1 = cons O nil

l2: list_nat
l2 = (cons (S O) (cons (S(S O)) nil))

l3: list_nat
l3 = (cons (S O) (cons ((S(S O)))(cons (S(S(S O))) nil)))


|||takes a pair of lists and returns the list made by appending the lists. 
appendp: pair (list_nat) (list_nat) -> list_nat
appendp (mkPair nil nil) = nil
appendp (mkPair nil (cons n m)) = (cons n m)
appendp (mkPair (cons n m) (cons a b)) = cons n (appendp (mkPair m (cons a b)))

--given list, find length
--length: list q -> nat
--length nil = O
--length (cons n m) = S(length m)

--new notation (::)
-- length': list q -> nat
-- length' nil = O
-- length' (n::m) = S (length' m)

--partial
-- append: list q -> list q -> list q
-- append nil b = b
-- append (cons n m) b = cons n (append m b)


--new notation (::)
-- append': list q -> list q -> list q
-- append' nil b = b
-- append' (n::m) b = n::(append' m b)
