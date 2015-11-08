module burrito
import listTest

data burrito = Chicken | Steak | BBQ | Carnitas

data burritoBowl = mkBurrito burrito Nat Nat Nat Nat

chicken: burritoBowl
chicken = mkBurrito Chicken 190 7 1 32

steak: burritoBowl
steak = mkBurrito Steak 190 7 2 30

bbq: burritoBowl
bbq = mkBurrito BBQ 170 7 2 24

carnitas: burritoBowl
carnitas = mkBurrito Carnitas 190 8 1 27

nutrition: list burritoBowl
nutrition = cons chicken (cons steak (cons bbq (cons carnitas nil)))
