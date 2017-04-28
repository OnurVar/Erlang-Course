-module(tail).
-export([fib/3,fib/1,perfect/1,perfect/3]).

fib(0,P,_) -> P;
fib(N,P,C) -> fib(N-1,C,P+C).
fib(N) -> fib(N,0,1).

perfect(N,N,S) -> N == S;
perfect(N,M,S) when N rem M == 0 -> perfect(N,M+1,S+M);
perfect(N,M,S) -> perfect(N,M+1,S).
perfect(N) -> perfect(N,1,0).
