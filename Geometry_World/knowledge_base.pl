% Plane Geometry Shape : King
% Circle : Oliver
% Polygon : Thomas
% Triangle : Megan
% Quadrilateral : Ava
% Jacob : Right Triangle
% Isosceles : William
% Equilateral : Emily
% Trapezoid : Susan
% Parallelogram : Smith
% Kite : Charlotte
% Jessica : Isosceles Trapezoid
% Rectangle : Lee
% Rhombus : Wilson
% Square : Martin


% Base facts
% Parents
parent(king, oliver).
parent(king, thomas).

parent(thomas, megan).
parent(thomas, ava).

parent(megan, jacob).
parent(magan, william).
parent(ava, susan).
parent(ava, charlotte).

parent(william, emily).
parent(susan, jessica).
parent(susan, smith).
parent(smith, lee).
parent(charlotte, wilson).

parent(lee, martin).
parent(wilson, martin).

% Shapes
isCircle(oliver).

isPolygon(thomas).
isPolygon(megan).
isPolygon(ava).
isPolygon(jacob).
isPolygon(william).
isPolygon(susan).
isPolygon(smith).
isPolygon(charlotte).
isPolygon(jessica).
isPolygon(lee).
isPolygon(wilson).
isPolygon(martin).

% Number of Edges 
hasThreeEdges(megan).
hasThreeEdges(jacob).
hasThreeEdges(william).
hasThreeEdges(emily).

hasFourEdges(ava).
hasFourEdges(susan).
hasFourEdges(smith).
hasFourEdges(charlotte).
hasFourEdges(jessica).
hasFourEdges(lee).
hasFourEdges(wilson).
hasFourEdges(martin).

% Equal Edges
containTwoEqualEdges(william).
containTwoEqualEdges(emily).
containTwoEqualEdges(jessica).
containTwoEqualEdges(smith).
containTwoEqualEdges(lee).
containTwoEqualEdges(charlotte).
containTwoEqualEdges(wilson).
containTwoEqualEdges(martin).

% Right Angle
containRightAngle(jacob).
containRightAngle(lee).
containRightAngle(martin).

% Parallel edges
containParalellEdges(susan).
containParalellEdges(smith).
containParalellEdges(jessica).
containParalellEdges(lee).
containParalellEdges(martin).

% Orthogonal diagonals
hasOrthogonalDiagonals(charlotte).
hasOrthogonalDiagonals(wilson).


% Derived predicates
isTriangle(X) :- hasThreeEdges(X).
isQuadrilateral(X) :- hasFourEdges(X).
isRightTriangle(X) :- isTriangle(X), containRightAngle(X).
isIsoscelesTriangle(X) :- isTriangle(X), containTwoEqualEdges(X).
isEquilateralTriangle(X) :- isIsoscelesTriangle(X), parent(william, X).
isTrapezoid(X) :- isQuadrilateral(X), containParalellEdges(X).
isKite(X) :- isQuadrilateral(X), hasOrthogonalDiagonals(X), containTwoEqualEdges(X).
isRhombus(X) :- isKite(X), containParalellEdges(X).
isParallelogram(X) :- isTrapezoid(X), parent(X, lee).
isIsoscelesTrapezoid(X) :- isTrapezoid(X), containTwoEqualEdges(X).
isRectangle(X) :- isParallelogram(X), containRightAngle(X).
isSquare(X) :- isRectangle(X), isRhombus(X).
isScaleneTriangle(X) :- isTriangle(X), \+ containTwoEqualEdges(X).
isSymmetric(X) :- 
    (isSquare(X);           
    isRectangle(X);       
    isRhombus(X);           
    isKite(X),              
    containParalellEdges(X),
    containTwoEqualEdges(X)). 
isAlwaysCyclic(X) :- 
    (isTriangle(X);
    isRectangle(X);
    isSquare(X);
    isIsoscelesTrapezoid(X)).
isAlwaysConvex(X) :- 
    (isTriangle(X);
    isTrapezoid(X);
    isParallelogram(X)).
isSuccessor(X, Y) :- 
    (parent(Y, X);
    parent(Y, Z), isSuccessor(X, Z)).
isAbleConcave(X) :- 
    (isPolygon(X), \+ isAlwaysConvex(X)).
isAbleNonCyclic(X) :-
    (isPolygon(X), \+ isAlwaysCyclic(X)).
isNonSymmetric(X) :- \+ isSymmetric(X).
hasDiagonalsIntersectAtMidpoint(X) :- 
    (isRectangle(X);
    isKite(X)).


% Test cases
% Test Cases for parent(Parent, Child)
:- write('Q1: Is Thomas parent of Ava? '),
    (parent(thomas, ava) -> write('Yes'), nl; write('No'), nl).
