man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).


parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).



men():- man(X), print(X), nl, fail.
women():- woman(X), print(X), nl, fail.
children(X):- parent(X,Y), print(Y), nl, fail.


mother(X,Y):- woman(X), parent(X,Y).
mother(X):- mother(Y,X), print(Y), nl.

brothers(X,Y):- parent(Z,X), parent(Z,Y), man(X), man(Y).
brothers(X):- brothers(X, Y), X\==Y, print(Y), nl, fail.

b_s(X,Y):- parent(Z,X), parent(Z,Y), woman(X), woman(Y), print(sisters).
b_s(X,Y):- parent(Z,X), parent(Z,Y), man(X), man(Y), print(brothers).
b_s(X,Y):- parent(Z,X), parent(Z,Y), ((man(X), woman(Y));(man(Y), woman(X))), print(siblings).


b_s(X):- b_s(X, Y), print(Y), nl, fail.


son(X,Y):- parent(Y,X), man(X).
son(X):- son(Y, X), print(Y), nl, fail.

sister(X,Y):- woman(X), parent(Z,X), parent(Z,Y), woman(Z), X\==Y.
sisters(X):- sister(Y, X), print(Y), nl, fail.




grand_ma(X,Y):- woman(X), parent(X,Z), parent(Z,Y).
grand_mas(X):- grand_ma(Y, X), print(Y), nl, fail.

grand_pa_and_son(X,Y):- man(X), man(Y),(parent(X,Z), parent(Z,Y));(parent(Y,Z), parent(Z,X)).

uncle(X, Y):- man(X), parent(Z,Y), parent(A,Z), parent(A,X), woman(A).
uncles(X):- uncle(Y,X), print(Y), nl, fail.