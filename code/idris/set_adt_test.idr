module set_adt_test
import eq
import list
import nat
import bool
import pair
import serialize
import option
import practice4


--test case for set_remove
y: (eq nat)=> set nat
y = set_remove O (mkSet ((S O)::O::nil))

--for set_cardinality
z: nat
z = set_cardinality (mkSet (O::(S O)::(S(S(S O)))::nil))

--set_member test case
x: bool
x = set_member' O (mkSet (S(S O)::O::nil)) 

--test case for set_union
u1: (eq nat) => set nat
u1 = set_union (mkSet (O::(S O)::nil)) (mkSet (O::(S(S O))::(S(S(S O)))::nil))

--test case for set_intersection
u: (eq nat) => set nat
u = set_intersection (mkSet (O::(S O)::nil)) (mkSet (O::nil))

-- test case for set_difference
v: set nat
v = set_difference (mkSet ((S O)::O::(S(S(S O)))::nil)) (mkSet (O::(S O)::nil))

-- test case for set_forall
w: bool
w = set_forall evenb (mkSet (O::(S O)::(S(S O)::nil)))


-- test case for set_exist 
s1: bool
s1 = set_exist evenb (mkSet (O::(S O)::nil))


--test case for set_witness
s2: option nat
s2 = set_witness evenb (mkSet (O::(S O)::(S(S O)::nil)))

--test case for set_product
s3: set(pair nat bool)
s3 = set_product (mkSet (O::(S O)::nil)) (mkSet (true::false::nil))

--test case eql_set
t2: (eq bool) => bool
t2 = eql_set (mkSet (true::false::true::nil)) (mkSet (false::true::true::nil))

--test case for set_toString
t1: (serialize bool) => String
t1 = set_toString (mkSet (true::false::true::false::nil))


--test case for set_powerset
t3: set (set Nat)
t3 = set_powerset (mkSet (1::2::3::nil))
