module colors
import pair
import bool

data color = red | green | blue | magenta | yellow | cyan


complement: color -> color
complement red = cyan
complement green = magenta
complement blue = yellow
complement cyan = red
complement magenta = green
complement yellow = blue

additive: color -> bool
additive red = true
additive blue = true
additive green = true
additive _ = false

subtractive: color -> bool
subtractive magenta = true
subtractive yellow = true
subtractive cyan = true
subtractive _ = false

complements: pair color color -> bool
complements (mkPair red cyan) = true
complements (mkPair cyan red) = true
complements (mkPair blue yellow) = true
complements (mkPair yellow blue) = true
complements (mkPair green magenta) = true
complements (mkPair magenta green) = true
complements (mkPair _ _ ) = false

mixink: pair color color -> color
mixink (mkPair cyan magenta) = blue
mixink (mkPair magenta cyan) = blue
mixink (mkPair magenta yellow) = red
mixink (mkPair yellow magenta) = red
mixink (mkPair yellow cyan) = green
mixink (mkPair cyan yellow) = green

notadditive: (color -> bool) -> (color -> bool)
notadditive additive a = not (additive a)

--subtractive: color -> bool
--subtractive c = not(additive c)

