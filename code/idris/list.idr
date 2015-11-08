module list
import nat
import natTest
import bool
import eq
import serialize

infixr 7 ::, ++
data list q = nil | (::) q (list q)


length: list q -> nat
length nil = O
length (n::m) = S (length m)

--append as infix operator ++
(++): list q -> list q -> list q
(++) nil b = b
(++) (n::m) b = n::(m++b)



ite: bool -> a -> a -> a
ite true tb fb = tb
ite false tb fb = fb

--general map
map: (a -> c) -> list a -> list c
map f nil = nil
map f (h::t) = (f h)::(map f t)

foldr: (a -> a -> a) -> a -> list a -> a
foldr f id nil = id
foldr f id (h::t) = f h (list.foldr f id t)



member: (eq a) => a -> list a -> bool
member v nil = false
member v (h::t) = ite(eql v h) true (member v t)

subset_elements: (eq a) => list a -> list a -> bool
subset_elements nil l = true
subset_elements (h::t) l = and (member h l) (subset_elements t l)

instance (eq a) => eq (list a) where
  eql nil nil = true
  eql (h::t) nil = false
  eql nil (h::t) = false
  eql (h1::t1) (h2::t2) = and (eql h1 h2) (eql t1 t2)
  
toStringList: (serialize a) => list a -> String
toStringList nil = " "
toStringList (h::nil) = (toString h)
toStringList (h::t) =  (toString h) ++ ", " ++ (toStringList t)

instance (serialize a) => serialize (list a) where
  toString l = "[" ++ (toStringList l) ++ "]"
  
  
  
  
