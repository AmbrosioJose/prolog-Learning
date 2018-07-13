% to run: swipl -g main prob1.pl
% then enter any number followed by a period
% Starting from 1 count to the number but follow these rules
% --- these are the rules
isFizz(Num):-0 is Num mod 3.
isBuzz(Num):-0 is Num mod 5.
isFizzbuzz(Num):- isFizz(Num), isBuzz(Num).
isCrackle(Num):-0 is Num mod 7.
isPop(Num):- 0 is Num mod 10.
isFizzcrackle(Num):- isFizz(Num), isCrackle(Num).
isFizzpop(Num):- isFizz(Num), isPop(Num).
isBuzzpop(Num):- isBuzz(Num), isPop(Num).
isBuzzcrackle(Num):- isBuzz(Num), isCrackle(Num).
isCracklepop(Num):- isCrackle(Num), isPop(Num).
isFizzbuzzcracklepop(Num):- isFizzbuzz(Num), isCracklepop(Num).
% ---

fizzbuzz(Num, Res):-
  isFizzbuzzcracklepop(Num) -> Res= 'fizzbuzzcracklepop';
  isFizzbuzz(Num) -> Res= 'fizzbuzz';
  isFizzcrackle(Num) -> Res= 'fizzcrackle';
  isFizzpop(Num) -> Res= 'fizzpop';
  isBuzzpop(Num) -> Res= 'buzzpop';
  isBuzzcrackle(Num) -> Res= 'buzzcrackle';
  isCracklepop(Num) -> Res= 'cracklepop';
  isFizz(Num) -> Res= 'fizz';
  isBuzz(Num) -> Res= 'buzz';
  isPop(Num) -> Res= 'pop';
  isCrackle(Num) -> Res= 'crackle';
  Res= Num.

fizzbuzzes(TopNum, TopNum, List):-
  List = [],!.
fizzbuzzes(TopNum, CurrentNum, [Head|Tail]):-
  CurrentNum > TopNum -> throw('the CorrectNum is greater than the topic');
  TopNum < 1 -> throw('TopNum is less than 1');
  (NextNum is CurrentNum + 1,
  fizzbuzz(CurrentNum, Head),
  fizzbuzzes(TopNum, NextNum, Tail)).

fizzbuzzes(TopNum, List):-
    OneHigher is TopNum + 1,
    fizzbuzzes(OneHigher, 1, List).

  printFizzbuzzes(TopNum):-
    fizzbuzzes(TopNum, Fizzbuzzlist),
    forall(member(X,Fizzbuzzlist), (print(X), nl)).

main :-
  read(X),
  printFizzbuzzes(X),
  halt.
