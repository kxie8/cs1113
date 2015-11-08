module gunrow
import nat
import listTest

data country = Argentina | Australia | Austria | Honduras | USA

|||A record of this type represents a country and death rate per 10,000,000 by gun for homocides, suicides, unintentional, other 
data gunrow = mkGunrow country Nat Nat Nat Nat

argentina: gunrow
argentina = mkGunrow Argentina 190 279 64 362

australia: gunrow
australia = mkGunrow Australia 11 62 5 8

austria: gunrow
austria = mkGunrow Austria 18 268 1 8

honduras: gunrow
honduras = mkGunrow Honduras 648 0 0 0

usa: gunrow
usa = mkGunrow USA 355 670 16 9

homicidePer10M: gunrow -> Nat
homicidePer10M (mkGunrow c h s u o) = h

suicidePer10M: gunrow -> Nat
suicidePer10M (mkGunrow c h s u o) = s

unintentionalPer10M: gunrow -> Nat
unintentionalPer10M (mkGunrow c h s u o) = u

otherPer10M: gunrow -> Nat
otherPer10M (mkGunrow c h s u o) = o

--list_gunrow with 5 elements country name, homocide, suicide, etc
listgunrow: list gunrow
listgunrow = cons argentina (cons australia (cons austria (cons honduras (cons usa nil))))
