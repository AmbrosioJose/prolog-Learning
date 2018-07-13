%to run: swipl -g main prob3.pl
%read a file and add print them as variables
main:-
  open("nightmareBeforeChristmas.txt",read,Stream),
  read(Stream, Character1),
  read(Stream, Character2),
  read(Stream, Character3),
  read(Stream, Character4),
  read(Stream, Character5),
  close(Stream),
  write([Character1, Character2, Character3, Character4, Character5]), nl,
  halt.
