module relationTest
import relation
import list
import bool
import Person
import people
import pair

years': Nat
years' = query plus 0 age gender people

totalHeight: Nat
totalHeight = query plus 0 height gender people

names: String
names = query (++) "" name gender people

--for query2
years'': Nat
years'' = query2 people gender age plus 0

totalInches'': Nat
totalInches'' = query2 people gender height mult 1

names'': String
names'' = query2 people gender name (++) ""

countOne: a -> Nat
countOne v = 1

count: Nat
count = query2 people gender countOne plus 0

 
avgHeight: pair Nat Nat
avgHeight = mkPair (query2 people gender height plus 0) (query2 people gender countOne plus 0)

