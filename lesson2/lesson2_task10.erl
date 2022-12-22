-module(lesson2_task10).
-import(lesson2_task05, [reverse/1]).
-export([encode/1]).

encode([])->
	[];
encode([H|T]) ->
	lesson2_task05:reverse(encode(T, H, 1, [H])).

encode([], _, CurrentAccum, [AccumH|AccumT]) ->
	[{CurrentAccum,AccumH}|AccumT];
encode([H|T], Previous, CurrentAccum, [AccumH|AccumT]) ->
	if
		H == Previous ->
			encode(T, H, CurrentAccum + 1, [AccumH|AccumT]);
		true ->
			encode(T, H, 1, [H|[{CurrentAccum,AccumH}|AccumT]])
	end.
