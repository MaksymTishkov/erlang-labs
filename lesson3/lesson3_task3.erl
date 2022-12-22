-module(lesson3_task3).
-import(lists, [reverse/1]).
-export([split/2]).

split(BinText, Separator) ->
	SepLength = length(Separator) * 8,
	<<Sep:SepLength>> = list_to_binary(Separator),
	lists:reverse(split(BinText, Sep, SepLength, [], [])).

split(<<>>, _, _, Accum, Res) ->
	[lists:reverse(Accum)|Res];
split(BinText, Sep, SepLength, Accum, Res) ->
	case BinText of
		<<CurrentSymbols:SepLength, Rest/binary>> ->
			if
				CurrentSymbols == Sep ->
					split(Rest, Sep, SepLength, [], [lists:reverse(Accum)|Res]);
				true ->
					<<Char/utf8, Rest1/binary>> = BinText,
					split(Rest1, Sep, SepLength, [Char|Accum], Res)
			end;
		<<Char/utf8, Rest1/binary>> ->
			split(Rest1, Sep, SepLength, [Char|Accum], Res)
	end.