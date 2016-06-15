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

info :- write("Geben sie ein Beziehung gefolgt von einem Punkt ein, um sie zu ermitteln."),
        nl,
        write("Es sind verfügabar: kind").

kind :- write("Geben sie ein Elternteil in Kleinbuchstaben geflogt von einem Punkt ein um dessen Kinder zu bekommen!"),
        nl,
        read(E),
        kind(X,E),
        nl,
        write(X), write(" ist kind von "), write(E),
        fail.

elternteil :- write("Geben sie den Namen des Elternteils in Kleinbuchstaben an, um sein Kinder zu bekommen oder Y für Unbekannt."),
              nl,
              read(E),
              nl,
              write("Geben sie das kind....."),
              nl,
              read(K),
              eteil(E, K),
              nl,
              write(E), write(" ist Elternteil von "), write(K),
              fail.


