module nat
import bool

data nat = O | S nat

|||returns true if the argument is (represents) zero, otherwise false
isZero: nat -> bool
isZero O = true
isZero (S _) = false
