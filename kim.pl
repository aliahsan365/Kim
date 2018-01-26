randomselect(Lines,R):-
	length(Lines,N),
	C is random(N),
	nth0(C,Lines,R).

read_file(Stream,[]) :-
    at_end_of_stream(Stream).

read_file(Stream,[X|L]) :-
    \+at_end_of_stream(Stream),
    read(Stream,X),
    read_file(Stream,L),!.


withoutlastelement([_],[]).
withoutlastelement([X|Xs],[X|Withoutlast]):-withoutlastelement(Xs,Withoutlast).


main :-
    open('restaurantesDelKim.txt', read, Str),
    read_file(Str,Lines),
    close(Str),
    withoutlastelement(Lines,L),
    randomselect(L,R),
    write('Kim dice que tenemos que ir al restaurante '),
    write(R), 
    nl,!.
    
