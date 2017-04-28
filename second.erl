-module(second).
-export([hypotenuse/2,perimeter/2,area/2]).

hypotenuse(A,B) ->
    H2 = first:square(A) + first:square(B),
    math:sqrt(H2).

perimeter(A, B) ->
    H = hypotenuse(A, B),
    A + B + H.

area(A, B) ->
    H = hypotenuse(A, B),
    first:area(H, A, B).