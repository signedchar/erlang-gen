-module(helloc).
-export([start/0, loop/0, client/2]).

start() ->
    spawn(?MODULE, loop, []).

loop() ->
    receive
        {Client, Name} ->
            Client ! {self(), io:format("Hello ~s! Welcome to Erlang!, using concurrency!~n", [Name])},
        loop()
    end.

client(Pid, Pass) ->
    Pid ! {self(), Pass},
    receive {Pid, Msg} ->
        Msg 
    end.