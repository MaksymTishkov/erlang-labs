-module(lesson2_task11).
-import(lesson2_task05, [reverse/1]).
-export([encode_modified/1]).

encode_modified([])->
	[];
encode_modified([H|T]) ->
	lesson2_task05:reverse(encode_modified(T, H, 1, [H])).

encode_modified([], _, CurrentAccum, [AccumH|AccumT]) ->
	if
		CurrentAccum == 1 ->
			[AccumH|AccumT];
		true ->
			[{CurrentAccum,AccumH}|AccumT]
	end;
encode_modified([H|T], Previous, CurrentAccum, [AccumH|AccumT]) ->
	if
		H == Previous ->
			encode_modified(T, H, CurrentAccum + 1, [AccumH|AccumT]);
		true ->
			if
				CurrentAccum == 1 ->
					encode_modified(T, H, 1, [H|[AccumH|AccumT]]);
				true ->
					encode_modified(T, H, 1, [H|[{CurrentAccum,AccumH}|AccumT]])
			end			
	end.
