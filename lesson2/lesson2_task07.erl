-module(lesson2_task07).
-import(lesson2_task05, [reverse/1]).
-export([flatten/1]).

flatten(L) ->
	lesson2_task05:reverse(flatten(L, [])).

flatten([H|T], A) ->
	flatten(T, flatten(H, A));
flatten([], A) -> 
	A;
flatten(E, A) ->
	[E|A].

