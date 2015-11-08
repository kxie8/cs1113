module relation
import list
import Person
import bool

query: (value -> value -> value) -> value -> (tuple -> value) -> (tuple -> bool) -> (list tuple) -> value
query reduce id project select relation = list.foldr reduce id (map project (filter select relation))


query2:  (list tuple) -> (tuple -> bool) -> (tuple -> value) ->
            (value -> value -> value) -> value -> value
query2 relation select project reduce id =
         list.foldr reduce id (map project (filter select relation))
