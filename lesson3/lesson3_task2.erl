-module(lesson3_task2).
-import(lists, [reverse/1]).
-export([words/1]).

words(BinText) ->
	lists:reverse(words(BinText, <<>>, [])).


words(<<>>, Word, Words) ->
	if
		Word == <<"">> ->
			Words;
		true ->
			[Word|Words]
	end;
words(<<" ", Rest/binary>>, Word, Words) ->
	if
		Word == <<"">> ->
			words(Rest, <<>>, Words);
		true ->
			words(Rest, <<>>, [Word|Words])
	end;	
words(<<Char/utf8, Rest/binary>>, Word, Words) ->
	words(Rest, <<Word/binary, Char/utf8>>, Words).