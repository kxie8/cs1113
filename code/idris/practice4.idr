 module practice4
import eq
import list
import nat
import bool
import pair
import serialize
import option

-- Now we decide to represent sets as lists with an additional
-- "representation invariant": list must have no duplicate members.
-- We do not make this invariant explicit in the code here. Rather,
-- the programmer must bear it in mind when writing the code that
-- is to follow. Note that this code provides an *implementation*
-- for the abstract specification given above.
data set a = mkSet (list a)

------------------------------------

-- Similarly here we give a list-based, concrete implementation of
-- the specifid "emptySet" abstration, representing the empty set
-- with an empty list.
emptySet': set a
emptySet' = mkSet nil

-------------------------------------

-- As a final note, here we provide a concrete implementation of the
-- isEmpty function specified above.
isEmpty': (s: set a) -> bool
isEmpty' (mkSet nil) = true
isEmpty' _ = false

-------------------------------------

-- And here t becomes absolutely clear that all we're doing here is
-- writing representation-(list)-specific implementation code that we
-- would ordinarily have put right under the type declaration for this
-- function. Separating this code allows us to see and to emphasie the
-- possibilities for separating specification and implementation ideas
-- when designing software.
set_insert': (eq a) => (v: a) -> (s: set a) -> set a
-- Return the set, s union {v}
set_insert' v (mkSet l) = ite (member v l)
                             (mkSet l)
                             (mkSet (v::l))

-- helper function: return list l without value v
list_remove: (eq a) => (v: a) -> (l: list a) -> list a
list_remove v nil = nil
list_remove v (h::t) = ite (eql v h) (list_remove v t) (h::(list_remove v t))

-- set_remove: (eq a) => (v: a) -> (s: set a) -> set a
-- Return the set, s - {v}
set_remove: (eq a) => (v: a) -> (s: set a) -> set a
-- Return the set, s - {v}
set_remove v (mkSet l) = mkSet (list_remove v l)



-- Return the number of elements in s
-- set_cardinality: (s: set a) -> nat
-- relies on rep invariant
set_cardinality: (s: set a) -> nat
set_cardinality (mkSet l) = (length l)
--length (nil {q = nat})



-- If v is in s return true, otherwise false
--set_member: (v: a) -> (s: set a) -> bool 
set_member': (eq a) => (v: a) -> (s: set a) -> bool 
set_member' v (mkSet nil) = false
set_member' v (mkSet (h::t)) = ite (eql v h) true (set_member' v (mkSet t))



-- combine 2 lists into one, avoiding duplicate elements: check list 1
  -- member with list 2 members
combine: (eq a) => list a -> list a -> list a
combine nil l1 = l1
combine (h::t) l2 = ite (member h l2) (combine t (list_remove h ((h::t)++l2))) (combine t l2)
--check list 2 members with list 1 members and return final combined list
combine2: (eq a)=> list a -> list a -> list a
combine2 l1 l2 = (combine l1 l2)++(combine l2 l1)

--return union of s1 and s2
set_union: (eq a) => (s1: set a) -> (s2: set a) -> set a
set_union (mkSet l1) (mkSet l2) = mkSet (combine2 l1 l2)


-- Return the intersection of  list 1 and 2
intersect': (eq a) => list a -> list a -> list a
intersect' nil _ = nil
intersect' (h::t) l2 = ite (member h l2) (h::(intersect' t l2)) (intersect' t l2)
-- Return the intersection of s1 and s2
set_intersection: (eq a) => (s1: set a) -> (s2: set a) -> set a
set_intersection (mkSet l1) (mkSet l2) = mkSet (intersect' l1 l2)



--helper function for set_difference: check list 1 member with list 2
  --member and return difference (for first list only)
list_difference: (eq a) => list a -> list a -> list a
list_difference nil nil = nil
list_difference nil l = nil
list_difference (h::t) s = ite (member h s) (combine t s) (h::(combine t s))
--helper function: check both lists and return final list of difference
list_difference2: (eq a)=> list a -> list a -> list a
list_difference2 l1 l2 = (combine l1 l2)++(combine l2 l1)

-- Return the set difference, s1 minus s2
set_difference: (eq a) => (s1: set a) -> (s2: set a) -> set a
set_difference (mkSet l1) (mkSet l2) = mkSet (list_difference2 l1 l2) 


-- Return true p is true for every v in s, otherwise false
set_forall: (p: a -> bool) -> (s: set a) -> bool
set_forall p (mkSet l) = list.foldr and true (map p l)


-- Return true if p is true for some v in s, otherwise else false
set_exist: (p: a -> bool) -> (s: set a) -> bool
set_exist p (mkSet l) = list.foldr or true (map p l)


-- If (set_exists p s), return (some v) such that (p v) is true,
-- else return none. We need to return an option because of course
-- in general there might not be an element in s with property p.
-- If there is one, we call it a "witness to the property, p."
list_witness: (a -> bool) -> list a -> option a
list_witness p nil = none
list_witness p (h::t) = ite (p h) (some h) (list_witness p t)

set_witness: (p: a -> bool) -> (s: set a) -> option a
set_witness p (mkSet l) = list_witness p l



-- Return the cartesian product of s1 and s2. That is, return the
-- set of all pairs whose first element is taken from s1 and whose
-- second element is taken from s2. For example, the product of the
-- sets {1, 2} and {a, b} is { (1, a), (1, b), (2, a), (2, b) }.
-- set_product: (s1: set a) -> (s2: set b) -> set (pair a b)

--takes an element h and list b and returns list of all pairs, (h,e),
  --where e is an element of b
help1: a -> list b -> list(pair a b)
help1 v nil = nil
help1 h (h2::t2) = (mkPair h h2):: (help1 h t2)
--given a list of a and a list of b return a list of all a-b pairs
help2: list a -> list b -> list (pair a b)
help2 nil l = nil
help2 l nil = nil
help2 (h::t) l = (help1 h l)++(help2 t l)

set_product: (s1: set a) -> (s2: set b) -> set (pair a b)
set_product (mkSet la) (mkSet lb) = mkSet (help2 la lb)




--implementation of set_eql
same_element: (eq a) => list a -> list a -> bool
same_element l1 l2 = and (subset_elements l1 l2) (subset_elements l2 l1)

eql_set: (eq a) => set a -> set a -> bool
eql_set (mkSet l1) (mkSet l2) = same_element l1 l2 


--implementation of set_toString
-- Return a string representation of s
toString': (serialize a) => set a -> String
toString' (mkSet (v::nil)) = (toString v)
toString' (mkSet nil) = ""
toString' (mkSet (h::t)) = (toString h)++","++(toString' (mkSet t))
set_toString: (serialize a) => set a -> String
set_toString (mkSet l) = "{" ++ (toString' (mkSet l)) ++"}"



--Return the set of all sets of elements of s.
-- For example, the powerset of {1, 2, 3} is the following set:
-- { {}, {1}, {2}, {3}, {1, 2}, {1, 3}, {2, 3}, {1, 2, 3} }. The
-- cardinality of the powerset of a set of cardinality n is 2^n.

appendSet: a -> set a -> set a
appendSet a (mkSet nil) = mkSet (a::nil)
appendSet h (mkSet l) = mkSet (h::l)

appendListSet: a -> list(set a) -> list(set a)
appendListSet h nil = (mkSet (h::nil))::nil
appendListSet h (h1::t) = (appendSet h h1)::(appendListSet h t)

powerList: list a -> list(set a)
powerList nil = nil
powerList (h::t) = appendListSet h (powerList t)


set_powerset: (s: set a) -> set (set a)
set_powerset (mkSet (h::t)) = mkSet ( (powerList (h::t))++(powerList t))
 
