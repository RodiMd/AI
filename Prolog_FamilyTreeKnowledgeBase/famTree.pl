wife(mum, george).
wife(kydd, spencer).
wife(elizabeth, philip).
wife(diana, charles).
wife(anne, mark).
wife(sarah, andrew).

daughter(elizabeth, mum, george).
daughter(margaret, mum, george).
daughter(diana, kydd, spencer).
daughter(anne, elizabeth, philip).
daughter(zara, anne, mark).
daughter(beatrice, sarah, andrew).
daughter(eugene, sarah, andrew).

son(charles, elizabeth, philip).
son(andrew, elizabeth, philip).
son(edward, elizabeth, philip).
son(william, diana, charles).
son(harry, diana, charles).
son(peter, anne, mark).

husband(X, Y) :- 
	wife(Y, X),	
	write(X), write(' is '), write(Y), write("'s husband"). 

child(X, Y, Z) :-
	daughter(X, Y, Z),
	write(X), write(' is the child of '), write(Y), write(' & '), write(Z). 
child(X, Y, Z) :-	
	son(X, Y, Z),
	write(X), write(' is the child of '), write(Y), write(' & '), write(Z).

parent(X, Y, Z) :-
	daughter(X, Y, Z),
	write(Y), write(' & '), write(Z), write(' are the parents of '), write(X). 
	
parent(X, Y, Z) :-	
	son(X, Y, Z),
	write(Y), write(' & '), write(Z), write(' are the parents of '), write(X).

grandchild(X, Y, Z) :-
	son(X1, X, Z1), 
	son(X2, Z2, X1), 
	write(X2).

grandchild(X, Y, Z) :-
	son(X1, X, Z1), 
	daughter(X2, Z2, X1), 
	write(X2).

grandchild(X, Y, Z) :-
	daughter(Y1, X, Z1),
	daughter(Y2, Y1, Z2), 
	write(Y2).

grandchild(X, Y, Z) :-
	daughter(Y1, X, Z1),
	son(Y2, Y1, Z2), 
	write(Y2).

greatgrandparent(X, Y, Z) :-
	daughter(X, Y, Z),
	daughter(Y1, N, M), 
	daughter(N1, R, S),
	write(X), write('s great grandparent are '), write(R), write(' & '), write(S).

greatgrandparent(X, Y, Z) :-
	son(X, Y, Z),
	son(Z, N, M), 
	son(M, R, S), 
	write(X), write('s great grandparent are '), write(R), write(' & '), write(S).

greatgrandparent(X, Y, Z) :-
	son(X, Y, Z), 
	daughter(Y, N, M), 
	daughter(N, R, S),
	write(X), write('s great grandparent are '), write(R), write(' & '), write(S).

greatgrandparent(X, Y, Z) :-
	son(X, Y, Z), 
	son(Z, N, M), 
	daughter(N, R, S),
	write(X), write('s great grandparent are '), write(R), write(' & '), write(S).

brother(X, Y, Z) :-
	son(X, Y, Z),
	son(N, Y, M),write(X), write('&'), write(N), write(' are brothers');
	daughter(N, Y, M),write(X), write('&'), write(N), write(' are brother and sister').
	 
sister(X, Y, Z) :-
	daughter(X, Y, Z),
	son(N, Y, M),write(X), write('&'), write(N), write(' are brother and sister');
	daughter(N, Y, M),write(X), write('&'), write(N), write(' are sisters').
	
sisterinlaw(X, Y, Z) :-
	wife(X, Y),
	son(Y, N, M),
	daughter(Y1, N, M1),
	write(X), write(' & '), write(Y1), write('are sisters in law').

uncle(X, Y, Z) :-
	daughter(X, Y, Z),
	daughter(Y, N, M),
	son(X1, N, M1),
	write(X1), write(' is '), write(X), write('s uncle').

uncle(X, Y, Z) :-
	daughter(X, Y, Z),
	son(Z, N, M),
	son(X1, N, M1),
	write(X1), write(' is '), write(X), write('s uncle').