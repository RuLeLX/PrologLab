parent(tom, liz).
parent(mary, liz).

parent(john, ben).
parent(janet, ben).

parent(john, jack).
parent(janet, jack).

parent(ben, tom).
parent(liz,lom).

parent(ben, tonya).
parent(liz, tonya).

%Male member of family
man(tom).
man(john).
man(ben).
man(jack).

woman(mary).
woman(janet).
woman(liz).
woman(tonya).

mother(X, Y):-
	parent(X, Y), woman(X).
	
brother(X, Y):-
	parent(Z, X), parent(Z, Y), man(X).
