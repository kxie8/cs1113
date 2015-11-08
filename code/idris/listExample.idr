module listExample
import movies
import listTest
import bool

listmovies: list' movies
listmovies = m1::(m2::nil')

listyears: list' Nat
listyears = t::(t'::nil')

listnames: list' String
listnames = n::(n'::nil')

getName: movies -> String
getName (Mkmovies name year action) = name

setName: movies -> String -> movies
setName (Mkmovies n a g) n' = Mkmovies n' a g

--record notation override function
setName': movies -> String -> movies
setName' x y = record { name = y } x

setYear': movies -> Nat -> movies
setYear' x y = record { year = y } x

movie: list' movies
movie = m1::m2::nil'

mapyear: list' movies -> list' Nat
mapyear nil' = nil'
mapyear (n::m) = (year n)::(mapyear m)
--mapyear movie expect m1 and m2 years

xmap: (a -> b) -> list' a -> list' b
xmap f nil' = nil'
xmap f (h::t) = (f h)::(xmap f t)
