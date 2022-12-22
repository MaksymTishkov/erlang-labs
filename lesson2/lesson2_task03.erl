-module(lesson2_task03).
-export([element_at/2]).

element_at([H], 1) ->
	H;
element_at([], _) ->
	undefined;
element_at([_|T], X) ->
	element_at(T, X - 1).
