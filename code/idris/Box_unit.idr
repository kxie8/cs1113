module Box
import unit
import bool

data Box = mkBox unit

b1: Box
b1 = (mkBox mkUnit)

b2: Box
b2 = (mkBox mkUnit)

unbox: Box -> unit
unbox (mkBox x) = mkUnit



