module tree
import nat

data tree = empty | cons nat tree tree

h1: tree
h1 = cons (S O) (cons (S O) empty empty) empty
