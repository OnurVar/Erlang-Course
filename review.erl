-export([perimeter/1, bits/1, area/1, enclose/1]).

perimeter({shape, X,Y})-> 
2*X+2*Y; 
perimeter({triangle,X,Y,Z}) -> 
X+Y+Z.

triangleArea (A,B,C) -> S = (A+B+C)/2, math:sqrt(S*(S-A)*(S-B)*(S-C)).

area({rectangle, {X,Y}, H,W})-> H*W; 
area({triangle,X,Y,Z}) -> triangleArea(X,Y,Z); 
area({circle,{X,Y},R})-> 3.14*R*R; 
area({shape,Coords}) -> [H|T] = Coords, 0.5*abs(areaShape(H, H, T, 0.0)).

areaShape({X1, Y1}, HeadCur, [], Accum)-> {Xi, Yi} = HeadCur, Accum+(Xi+X1)*(Yi-Y1); 
areaShape(HeadFirst, HeadCur, [HeadNext|CoordsTail], Accum)-> {Xi, Yi} = HeadCur, {Xi_1, Yi_1} = HeadNext, 
areaShape(HeadFirst, HeadNext, CoordsTail, Accum+(Xi+Xi_1)*(Yi-Yi_1)).

enclose({rectangle, Coords, H,W})-> {rectangle, Coords, H,W}; 
enclose({circle,{X,Y},R})-> {rectangle, {X-R, Y-r}, 2*R, 2*R}; 
enclose({shape,Coords}) -> MinLeftPoint = minimum(Coords, fun ({X1,_}, {X2,_})->X1<X2 end), MinTopPoint = minimum(Coords, fun ({_,Y1}, {_,Y2})->Y1<Y2 end), MaxRightPoint = maximum(Coords, fun ({X1,_}, {X2,_})->X1>X2 end), MaxBottomPoint = maximum(Coords, fun ({_,Y1}, {_,Y2})->Y1>Y2 end), {rectangle, {element(1,MinLeftPoint), element(2,MinLeftPoint)}, element(1,MaxRightPoint) - element(1,MinLeftPoint), element(2,MinTopPoint) - element(2,MaxBottomPoint) }.

bitsArr(0, Accum)-> Accum; 
bitsArr(N, Accum)-> 
bitsArr(N bsr 1, [N band 1|Accum]).

bits(N)-> lists:foldr(fun(X, Sum)-> X+ Sum end, 0, bitsArr(N, [])).

%----------------------------------- 
minimum([], _) -> io:format("can not find minimum of empty list~n");

minimum([H|T], CompareFun) -> 
minimum(H, T, CompareFun).

minimum(Min, [H|T], CompareFun) -> 
case CompareFun(Min, H) of 
1 -> minimum(Min, T); 
_ -> minimum(H, T) 
end;

minimum(Min, [], _) -> Min.

maximum([], _) -> io:format("can not find max from empty list~n"); 
maximum([H|T], CompareFun)-> 
maximum(H, T, CompareFun).

maximum(Max, [H|T], CompareFun)-> 
case CompareFun(Max,H) of 
0 -> maximum(Max, T); 
_ -> maximum(H, T) 
end; 
maximum(Max, [], _) -> Max.

