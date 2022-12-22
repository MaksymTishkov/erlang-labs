-module(lesson2_task14).
-import(lesson2_task05, [reverse/1]).
-export([duplicate/1]).

duplicate([]) ->
	[];
duplicate(L)->
	lesson2_task05:reverse(duplicate(L, 1, [])).

duplicate([], _, Accum) ->
	Accum;
duplicate([H|T], N, Accum) ->
	if
		N < 2 ->
			duplicate([H|T], N+1, [H|Accum]);
		true ->
			duplicate(T, 1, [H|Accum])
	end.