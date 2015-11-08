module dna
import nat
import list 
import pair

data base = A | T | C | G


complement_base: base -> base
complement_base A = T
complement_base T = A
complement_base C = G
complement_base G = C

--take a list of base and return complementary strand
complement_strand: list base -> list base
complement_strand l = map complement_base l
--complement_strand: (base -> base) -> list base -> list base
--complement_strand complement_base nil = nil
--complement_strand complement_base (h::t) = (complement_base h)::(complement_strand complement_base t)

--takes a DNA molecule and returns the first strand
strand1: list (pair base base) -> list base
strand1 ((mkPair a b)::t) = a::(strand1 t)

--takes a DNA molecule and returns the second  strand
strand2: list (pair base base) -> list base
strand2 ((mkPair a b)::t) = b::(strand2 t)

-- takes a strand of DNA and returns both the strand and its complement strand
x: base -> pair base base
x b = (mkPair b (complement_base b))

complete: list base -> list (pair base base)
complete l = map x l
--complete:(base -> base) -> list base -> list (pair base base)
--complete complement_base nil = nil
--complete complement_base (h::t) = (mkPair h (complement_base h))::(complete complement_base t)

-- given a list of base, count the number(nat) of a given base in the list
baseNat: base -> base -> Nat
baseNat A A = 1
baseNat T T = 1
baseNat C C = 1
baseNat G G = 1
baseNat _ _ = 0

countBase: list base -> base -> Nat
countBase l b = list.foldr plus 0 (map (baseNat b) l)
--countBase: base -> list base -> nat
--countBase id x = list.foldr add 
 
