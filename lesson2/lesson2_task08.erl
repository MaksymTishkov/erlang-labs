-module(lesson2_task08).
-import(lesson2_task05, [reverse/1]).
-export([compress/1]).

compress([])->
	[];
compress([H|T]) ->
	lesson2_task05:reverse(compress(T, H, [H])).

compress([], _, Accum) ->
	Accum;
compress([H|T], Previous, Accum) ->
	if
		H == Previous ->
			compress(T, H, Accum);
		true ->
			compress(T, H, [H|Accum])
	end.
