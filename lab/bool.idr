module bool

data bool = true|false

id:bool -> bool
id true = true
id false = false

not:bool -> bool
not false = true
not true = false

t: bool -> bool
t true = true
t false = true

f: bool -> bool
f false = false
f true = false
