-module(lesson2_task05).
-export([reverse/1]).

reverse(L) ->
	reverse(L, []).

reverse([], R) ->
	R;
reverse([H|T], R) -> 
	reverse(T, [H|R]).