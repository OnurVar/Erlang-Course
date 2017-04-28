-module(first).         
-export([double/1,mult/2,area/3,is_zero/1,maxTwo/2,maxThree/3,howManyEqual/3,xOr/2,fac/1,fib/1,pieces/1,loop/1,perfect/1]).
-include_lib("eunit/include/eunit.hrl").
mult(X,Y) ->
    X*Y.

double(X) ->
    mult(2,X).

area (A,B,C) ->
    S = (A+B+C)/2,
math:sqrt(S*(S-A)*(S-B)*(S-C)).

is_zero(0) ->
    true;
is_zero(_) ->
    false.

maxTwo(X,Y) ->
    if
        X > Y ->
            X;
        true ->
            Y
    end.

maxThree(X,Y,Z) ->
    maxTwo(maxTwo(X,Y),maxTwo(Y,Z)).

howManyEqual (X,X,X) -> 3;
howManyEqual (X,Y,Z) when (X == Y) or (Y == Z) or (X == Z) -> 2;
howManyEqual (_,_,_) -> 0.

xOr(X,Y) ->
    (X and not Y) or (not X and Y).

fac(0) -> 1;
fac(X) when X > 0 -> fac(X - 1)*X.


fib(0) -> 0;
fib(1) -> 1;
fib(X) -> fib(X - 1) + fib(X - 2).

pieces(0) -> 1;
pieces(X) when X > 0 -> X + pieces(X - 1).


loop(N) when N > 0 -> io:format("~p~n",[N]),loop (N - 1);
loop(_) -> io:format("bye~n").


perfect(N) when N > 0 -> perfect(N, 1, 0).
perfect(N, N, A) -> N == A;
perfect(N, C, A) when N rem C == 0 -> perfect(N, C+1, A+C);
perfect(N, C, A) -> perfect(N, C+1, A).
perfect_test() -> ?assert(perfect(6)), ?assertNot(perfect(27)),?assert(perfect(28)),?assertException(error, function_clause, perfect(-1)).


%%% ----  To Compile ---- %%%
%c(first).