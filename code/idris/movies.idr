module movies
import bool
import relation
import Person
import list
import pair

||| A record type that is equivalent to:
||| (data movies = mkmovies String nat bool)
||| but where we give names to fields.
||| A movie has a name,release year, and true or false
||| if it's an action movie.
record movies where
    constructor Mkmovies
    name : String
    year : Nat
    action: bool

-- An example value of type movies
m1: movies
m1 = Mkmovies "Avengers" 2012 true

m2: movies
m2 = Mkmovies "Imitation Game" 2014 false

m3: movies
m3 = Mkmovies "Avatar: The Last Air Bender" 2005 true

-- release date of movie m1
t: Nat
t = year m1
-- expect 2012

-- Here we get the name of movie m1.
n: String
n = name m1
-- expect "Avengers"

-- Here we get whether or not m1 is action movie
a: bool
a = action m1
--expect true

--name, year, action genre for m2
n': String
n' = name m2
--expect "Imitation Game"

t': Nat
t' = year m2
--expect 2014

a': bool
a' = action m2
--expect false

movies': list movies
movies' = m1::m2::m3::nil

countOne: x -> Nat
countOne v = 1

--how many action movies
number: Nat
number = query2 movies' action countOne plus 0

-- bettre way to count action movies
countrel: (list tuple) -> (tuple -> bool) -> Nat
countrel x y = query2 x y countOne plus 0
--test case
c: Nat
c = countrel movies' action

sumrel: (list tuple) -> (tuple -> bool) -> (tuple -> Nat) -> Nat
sumrel rel sel proj = query2 rel sel proj plus 0
--test case
s: Nat
s = sumrel movies' action year

--average year of production for action movies 
avgYear: pair Nat Nat
avgYear = mkPair (query2 movies' action year plus 0)(query2 movies' action countOne plus 0)
--expect 4017/2
