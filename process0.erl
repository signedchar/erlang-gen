-module(process0).
-export([start/0, loop/0, client/2]).

start() ->
    spawn(?MODULE, loop, []).

loop() ->
    receive
        {From, {square, L}} ->
            From ! io:format("Square area is ~p~n", [area({square, L})]),
            loop();
        {From, {rectangle, Height, Width}} ->
            From ! io:format("Rectangle area is ~p~n", [area({rectangle, Height, Width})]),
            loop()
    end.

-spec area({atom(), integer()}) -> integer(); ({atom(), integer(), integer()}) -> integer().
area({square, L}) ->
    L * L;
area({rectangle, Height, Width}) ->
    Height * Width.

client(Pid, Msg) ->
    Pid ! {self(), Msg},
    receive Response ->
        Response
    end.    