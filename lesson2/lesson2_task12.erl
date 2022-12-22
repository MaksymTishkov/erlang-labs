-module(lesson2_task12).
-import(lesson2_task05, [reverse/1]).
-export([decode_modified/1]).

decode_modified([]) ->
	[];
decode_modified(L)->
	lesson2_task05:reverse(decode_modified(L, [])).

decode_modified([], Accum) ->
	Accum;
decode_modified([{N,X}|T], Accum) ->
	if
		N == 1 ->
			decode_modified(T, [X|Accum]);
		true ->
			decode_modified([{N-1,X}|T], [X|Accum])
	end;
decode_modified([X|T], Accum) ->
	decode_modified(T, [X|Accum]).