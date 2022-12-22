-module(lesson2_task15).
-import(lesson2_task05, [reverse/1]).
-export([replicate/2]).

replicate([], _) ->
	[];
replicate(L, N)->
	if
		N < 1 ->
			[];
		true ->
			lesson2_task05:reverse(replicate(L, 1, N, []))
	end.
	

replicate([], _, _, Accum) ->
	Accum;
replicate([H|T], N, Target, Accum) ->
	if
		N < Target ->
			replicate([H|T], N+1, Target, [H|Accum]);
		true ->
			replicate(T, 1, Target, [H|Accum])
	end.