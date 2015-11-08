module friend
import bool

|||friend who's trustworthy, has name ,age

data friend = mkFriend bool String Nat

f1: friend
f1 = mkFriend false "Jake" 20

f2: friend 
f2 = mkFriend true "finn" 17

getAge: friend -> Nat
getAge (mkFriend b s n) = n

getName: friend -> String
getName (mkFriend b s n) = s

getTrust: friend -> bool
getTrust (mkFriend b s n) = b
