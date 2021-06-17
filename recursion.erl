-module(recursion).
-export([lmap/2, fact/1, llength/1, reverse/1, even_and_odds/1]).

lmap(_, []) ->
    [];
lmap(Fn, [H|T]) ->
    [Fn(H)| lmap(Fn, T)].

fact(0) ->
    1;
fact(X) when X > 0 ->
    X * fact(X-1).

llength([]) ->
    0;
llength([_|T]) ->
    1 + llength(T).

reverse([]) ->
    [];
reverse([H|T]) ->
    reverse(T)++[H].

even_and_odds(L) ->
    even_and_odds_acc(L, [], []).

even_and_odds_acc([H|T], Even, Odds) ->
    case (H rem 2) of
        0 -> even_and_odds_acc(T, [H|Even], Odds);
        1 -> even_and_odds_acc(T, Even, [H|Odds])
    end;
even_and_odds_acc([], Even, Odds) ->
    {Even, Odds}.