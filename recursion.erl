-module(recursion).
-export([lmap/2, fact/1, llength/1, reverse/1]).

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