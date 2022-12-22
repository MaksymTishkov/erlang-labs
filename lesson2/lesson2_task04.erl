-module(lesson2_task04).
-export([len/1]).

len([]) ->
	0;
len([H|T]) ->
	len([H|T], 0).

len([], X) ->
	X;
len([_|T], X) ->
	len(T, X + 1).


