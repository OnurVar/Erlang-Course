-module(shape_bits).
-export([perimeter/1,area/1]).

perimeter({triangle, A, B, C}) -> A + B + C;
perimeter({rectangle, H, W}) -> 2*W + 2*H.

area({triangle,A,B,C}) -> S = (A + B + C) / 2.0, math:sqrt( S * (S - A) * ( S - B ) * ( S - C ));
area({rectangle,W,H}) -> W * H.