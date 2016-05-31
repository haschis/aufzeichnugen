% Autor:
% Datum: 18.05.2016

eteil(burkhard, ben).
eteil(claudia, ben).
eteil(burkhard, charlotte).
eteil(claudia, charlotte).
eteil(gertraud, claudia).
eteil(peter, claudia).
eteil(gertraud, alexandra).
eteil(peter, alexandra).
eteil(erika, burkhard).
eteil(erika, claudiaBK).
eteil(bernhard, claudiaBK).
eteil(bernhard, burkhard).
eteil(claudiaBK, felix).
eteil(claudiaBK, jonas).
eteil(claudiaBK, moritz).
eteil(juergen, felix).
eteil(juergen, jonas).
eteil(juergen, moritz).
eteil(alexandra, mathies).
eteil(andreas, mathies).
eteil(alexandra, sophie).
eteil(andreas, sophie).
eteil(paul, bernhard).

weiblich(charlotte).
weiblich(claudia).
weiblich(erika).
weiblich(gertraud).
weiblich(claudiaBK).
weiblich(alexandra).
weiblich(sophie).

maennlich(ben).
maennlich(burkhard).
maennlich(peter).
maennlich(bernhard).
maennlich(moritz).
maennlich(jonas).
maennlich(felix).
maennlich(juergen).
maennlich(andreas).
maennlich(paul).

kind(X,Y) :- eteil(Y,X).
vater(X,Y) :- eteil(X,Y), maennlich(X).
mutter(X,Y) :- eteil(X,Y), weiblich(X).
geschwister(X,Y) :- eteil(E,X), eteil(E,Y), X \== Y.
bruder(X,Y) :- geschwister(X,Y), maennlich(X).
schwester(X,Y) :- geschwister(X,Y), weiblich(X).
grosseteil(G,E) :- eteil(G,K), eteil(K,E).
grossvater(G,E) :- grosseteil(G,E), maennlich(G).
grossmutter(G,E) :- grosseteil(G,E), weiblich(G).
geschwisterkind(N,T) :- eteil(E,N), geschwister(T,E).
neffe(N,T) :- geschwisterkind(N,T), maennlich(N).
nichte(N,T) :- geschwisterkind(N,T), weiblich(N).
tante(T,N) :- geschwisterkind(N,T), weiblich(T).
onkel(O,N) :- geschwisterkind(N,O), maennlich(O).

urgroßvater(U,Urenkel) :- maennlich(U), eteil(U,Großeteil), eteil(Großeteil,Parent), eteil(Parent,Urenkel).

mutter(X, Y) :- eteil(X, Y), weiblich(X).
großvater(X, Z) :- eteil(X, Y), eteil(Y, Z), maennlich(X).
geschwister(X, Z) :- eteil(Mutter, X), eteil(Mutter, Z), eteil(Vater, X), eteil(Vater, Z), X \== Z, Vater \== Mutter.
neutralerneffe(X,Onkeltante) :- eteil(Z,X), geschwister(Z,Onkeltante).
