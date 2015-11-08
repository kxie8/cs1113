module people
data people =  mary | maurice
data pair a b = Doyoulove a b

--fst: pair a b -> a
--fst (Doyoulove f s) = f
--snd: pair a b -> b
--snd (Doyoulove f s) = s

Mary: pair people people -> people
Mary (Doyoulove mary maurice) = maurice

Maurice: pair people people -> people
Maurice (Doyoulove mary maurice) = maurice

