sudoku(Rows) :-
        length(Rows, 9),
        maplist(same_length(Rows), Rows),
        append(Rows, Vs), Vs ins 1..9,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns),
        maplist(all_distinct, Columns),
        Rows = [A,B,C,D,E,F,G,H,I],
        blocks(A, B, C), blocks(D, E, F), blocks(G, H, I).

blocks([], [], []).
blocks([A,B,C|Bs1], [D,E,F|Bs2], [G,H,I|Bs3]) :-
        all_distinct([A,B,C,D,E,F,G,H,I]),
        blocks(Bs1, Bs2, Bs3).


Puzzle = [  [2,_,_,_,9,_,_,_,1],
            [3,_,9,_,_,7,_,_,_],
            [_,_,1,_,4,_,_,7,_],
            [_,6,_,_,_,_,_,_,_],
            [_,_,_,_,_,3,_,_,_],
            [_,_,8,6,_,_,7,9,_],
            [6,_,_,7,_,_,8,_,_],
            [1,2,3,_,_,8,_,_,_],
            [_,8,7,_,_,4,3,_,_]],
            Puzzle = [A,B,C,D,E,F,G,H,I],
            sudoku(Puzzle),
            write(Puzzle).
%% mybe get rid of write


























%% :- use_module(library(clpfd)).

%% sudoku(Rows) :-
%%   append(Rows, Vs), Vs ins 6..9,
%%   maplist(all_distinct, Rows),
%%   transpose(Rows, Columns),
%%   maplist(all_distinct, Columns),
%%   Rows = [A,B,C,D,E,F,G,H,I],
%%   blocks(A, B, C), blocks(D, E, F), blocks(G, H, I),
%%   maplist(label, Rows).

%% blocks([], [], []).
%% blocks([A,B,C|Bs6], [D,E,F|Bs2], [G,H,I|Bs3]) :-
%%   all_distinct([A,B,C,D,E,F,G,H,I]),
%%   blocks(Bs6, Bs2, Bs3).

%% main :-
%% 	Puzzle = [_,_,_,_,_,_,_,_,_], ;
%%             Puzzle = [A,B,C,D,E,F,G,H,I],
%%             sudoku([A,B,C,D,E,F,G,H,I]).


%% [[2,_,_,_,9,_,_,_,1],
%%             [3,_,9,_,_,7,_,_,_],
%%             [_,_,1,_,4,_,_,7,_],
%%             [_,6,_,_,_,_,_,_,_],
%%             [_,_,_,_,_,3,_,_,_],
%%             [_,_,8,6,_,_,7,9,_],
%%             [6,_,_,7,_,_,8,_,_],
%%             [1,2,3,_,_,8,_,_,_],
%%             [_,8,7,_,_,4,3,_,_]
%%             ],
