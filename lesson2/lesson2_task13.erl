-module(lesson2_task13).
-import(lesson2_task05, [reverse/1]).
-export([decode/1]).

decode([]) ->
	[];
decode(L)->
	lesson2_task05:reverse(decode(L, [])).

decode([], Accum) ->
	Accum;
decode([{N,X}|T], Accum) ->
	if
		N == 1 ->
			decode(T, [X|Accum]);
		true ->
			decode([{N-1,X}|T], [X|Accum])
	end.