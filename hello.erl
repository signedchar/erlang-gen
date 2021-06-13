-module(hello).
-export([hi/0]).

hi() ->
    io:format("Hello Erlang!~n").