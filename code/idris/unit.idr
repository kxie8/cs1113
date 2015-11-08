module unit
import eq
import bool
import serialize
data unit = mkUnit


unit_id: unit -> unit
unit_id mkUnit = mkUnit
--unit_id is a function of unit to unit and has the rule mkUnit = mkUnit

eql_unit: unit -> unit -> bool
eql_unit v1 v2 = true

-- overloaded operators
instance eq unit where
 -- eql u1 u2 = eql_unit u1 u2
   eql u1 u2 = true

instance serialize unit where
  toString u = "()"
