-module(lesson2_task09).
-import(lesson2_task05, [reverse/1]).
-export([pack/1]).

pack([])->
	[];
pack([H|T]) ->
	lesson2_task05:reverse(pack(T, H, [H], [])).

pack([], _, CurrentAccum, Accum) ->
	[CurrentAccum|Accum];
pack([H|T], Previous, CurrentAccum, Accum) ->
	if
		H == Previous ->
			pack(T, H, [H|CurrentAccum], Accum);
		true ->
			pack(T, H, [H], [CurrentAccum|Accum])
	end.
