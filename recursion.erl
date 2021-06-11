map(Fn, []) ->
    [];
map(Fn, [H|T]) ->
    [Fn(H)| map(T)].