module newlist

infixr 7 ::

data list a = nil | (::) a (list a)

map: (a -> b) -> list a -> list b
map f nil = nil
map f (h::t) = (f h)::(map f t)


