module set
import eq
import list
import Person
import bool
import nat
import serialize

||| mkSet is meant to be private
data set a = mkSet (list a)

||| starting for building set
new_set: set nat
new_set = mkSet nil

--set_insert: a -> set a -> set a
--set_insert v (mkSet l) = ite (member v l) (mkSet l) (mkSet (v::l))
--set_insert v (mkset l) = mkset (v::l)



same_element: (eq a) => list a -> list a -> bool
same_element l1 l2 = and (subset_elements l1 l2) (subset_elements l2 l1)

eql_set: (eq a) => set a -> set a -> bool
eql_set (mkSet l1) (mkSet l2) = same_element l1 l2 

eql_set': (eq a) => set a -> set a ->bool
eql_set' (mkSet l1) (mkSet l2) = eql l1 l2

instance (eq a) => eq (set a) where
  eql s1 s2 = eql_set s1 s2

--ex1: bool
--ex1 = eql (mkSet(O::(S O)::nil)) (mkSet((S O):: O ::nil))
--expect true

--ex2:bool
--ex2 = eql (mkSet(O::(S(S O))::nil)) (mkSet(O::nil))
--expect false

--ex3: bool
--ex3 = eql (mkSet(O::(S O)::nil)) (mkSet(O::(S O)::nil))
--expect true

instance (serialize a) => serialize (set a) where
  toString (mkSet l) = "{" ++ (toStringList l) ++ "}"


set_member: (eq a) => (v: a) -> (s: set a) -> bool
set_member v (mkSet nil) = false
set_member v (mkSet (h::t)) = ite (eql v h) true (set_member v (mkSet t))

--set_union: (eq a) => (s1: set a) -> (s2: set a) -> set a
--set_union (mkSet l1) (mkSet l2) = (mkSet (l1 l2))

--set_intersection: (eq a) => (s1: set a) -> (s2: set a) -> set a
--set_intersection (mkSet (h::t)) (mkSet a) = ite (set_member h (mkSet a)) 
                              -- (h::(set_intersection (mkSet t) (mkSet a))) 
                                   -- (set_intersection (mkSet t) (mkSet a))

intersect: (eq a) => list a -> list a -> list a
intersect nil _ = nil
intersect (h::t) l2 = ite (member h l2) (h::(intersect t l2)) (intersect t l2)
--set_intersection: (eq a) => list a -> list a -> list a
--set_intersection (mkSet s) (mkSet l) = intersect s l

--set_forall: (p: a -> bool) -> (s: set a) -> bool
--set_forall p (mkSet l) = 
--set_forall p (mkSet nil) = true
--set_forall p (mkSet (h::t)) = ite (p h) (set_forall p (mkSet t)) false


