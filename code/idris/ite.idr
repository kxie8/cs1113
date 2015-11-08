module ite
import bool


ite: bool -> a -> a -> a
ite true tb fb = tb
ite false tb fb = fb

ite': bool -> String -> String -> String
ite' true "yes" "no" = "yes"
ite' false "yes" "no" = "no"
