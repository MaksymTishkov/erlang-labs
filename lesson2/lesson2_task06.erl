-module(lesson2_task06).
-import(lesson2_task05, [reverse/1]).
-export([is_palindrome/1]).

is_palindrome(L) ->
	is_palindrome(L, reverse(L)).

is_palindrome([], []) ->
	true;
is_palindrome([H], [RH]) ->
	if 
		H == RH -> true;
		true ->	false
	end;
is_palindrome([H|T], [RH|RT]) ->
	case (H == RH) and is_palindrome(T, RT) of
		true-> true;
		false ->	false
	end.