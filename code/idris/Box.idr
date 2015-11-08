module Box
import eq
import bool
import serialize
data Box t = mkBox t
--Box becamse type constructor
--Box t is type -> type

unbox: Box t -> t
unbox (mkBox x) = x

--eql_box: (eq a) => Box a -> Box a -> bool
--eql_box (mkBox v1) (mkBox v2) = eql v1 v2

instance (eq a) => eq (Box a) where
  eql (mkBox v1) (mkBox v2) = eql v1 v2

instance (serialize a) => serialize (Box a) where
  toString (mkBox b) = "(" ++ (toString b) ++ ")"

