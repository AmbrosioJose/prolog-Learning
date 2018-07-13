%to run: swipl -g main prob2.pl
%writing to file in prolog
 writeCharactertoFile(Character, Stream):-
   write(Stream, Character), nl(Stream).


main:-
  open("nightmareBeforeChristmas.txt",write,Stream),
  foreach(member(Character, ['jackSkelington.', 'oogieBoogie.', 'sally.', 'sandyClaws.', 'zero.']),
   writeCharactertoFile(Character, Stream)), close(Stream), halt.
