module presents
data Box t = wrap t
data presents = cat | coat
data pair a b = choose a b

edGet: Box presents -> presents
edGet (wrap coat) = coat

alGet: Box presents -> presents
alGet (wrap cat) = cat

ed: pair presents presents -> presents
ed (choose cat coat) = coat

al: pair presents presents -> presents
al (choose cat coat) = cat
