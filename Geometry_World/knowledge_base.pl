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
parent(smith, wilson).
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
containParalellEdges(wilson).
containParalellEdges(martin).

% Orthogonal diagonals
hasOrthogonalDiagonals(charlotte).
hasOrthogonalDiagonals(wilson).
hasOrthogonalDiagonals(martin).


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
    (isIsoscelesTrapezoid(X);
    isParallelogram(X);
    isKite(X);
    isIsoscelesTriangle(X);
    isCircle(X)). 
isSymmetric(X) :- 
    (isIsoscelesTrapezoid(X)). 
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
isNonSymmetric(X) :- 
    (isPolygon(X), \+ isSymmetric(X)).
hasDiagonalsIntersectAtMidpoint(X) :- 
    (isRectangle(X);
    isKite(X)).


% Test cases
% Test Cases for parent(Parent, Child)
:- write('Q1: Is Thomas parent of Ava? '),
    (parent(thomas, ava) -> write('Yes'), nl; write('No'), nl).

:- write('Q2: Who is parent of Martin? '),
    (findall(Parent, parent(Parent, martin), Parents), list_to_set(Parents, UniqueParents)),
    (UniqueParents = [] -> write('not found'), nl; write(UniqueParents), nl).

:- write('Q3: Is King parent of Oliver? '),
    (parent(king, oliver) -> write('Yes'), nl; write('No'), nl).

% Test Cases for isCircle(Shape)
:- write('Q4: Is Oliver a Circle? '),
    (isCircle(oliver) -> write('Yes'), nl; write('No'), nl).

:- write('Q5: Is Thomas a Circle? '),
    (isCircle(thomas) -> write('Yes'), nl; write('No'), nl).

:- write('Q6: Is Megan a Circle? '),
    (isCircle(megan) -> write('Yes'), nl; write('No'), nl).

% Test Cases for isPolygon(Shape)
:- write('Q7: Is Thomas a Polygon? '),
    (isPolygon(thomas) -> write('Yes'), nl; write('No'), nl).

:- write('Q8: Is Megan a Polygon? '),
    (isPolygon(megan) -> write('Yes'), nl; write('No'), nl).

:- write('Q9: Is Ava a Polygon? '),
    (isPolygon(ava) -> write('Yes'), nl; write('No'), nl).

% Test Cases for hasThreeEdges(Shape)
:- write('Q10: Does Megan have three edges? '),
    (hasThreeEdges(megan) -> write('Yes'), nl; write('No'), nl).

:- write('Q11: Does Jacob have three edges? '),
    (hasThreeEdges(jacob) -> write('Yes'), nl; write('No'), nl).

:- write('Q12: Does William have three edges? '),
    (hasThreeEdges(william) -> write('Yes'), nl; write('No'), nl).

% Test Cases for hasFourEdges(Shape)
:- write('Q13: Are there any triangles with four edges? '),
    (findall(Triangle, hasFourEdges(Triangle), Triangles), list_to_set(Triangles, UniqueTriangles)),
    (UniqueTriangles = [] -> write('No'), nl; write('Yes'), nl).

:- write('Q14: Does Ava have four edges? '),
    (hasFourEdges(ava) -> write('Yes'), nl; write('No'), nl).

:- write('Q15: Does Susan have four edges? '),
    (hasFourEdges(susan) -> write('Yes'), nl; write('No'), nl).

% Test Cases for containTwoEqualEdges(Shape)
:- write('Q16: Does William contain two equal edges? '),
    (containTwoEqualEdges(william) -> write('Yes'), nl; write('No'), nl).

:- write('Q17: Does Emily contain two equal edges? '),
    (containTwoEqualEdges(emily) -> write('Yes'), nl; write('No'), nl).

:- write('Q18: Does Jessica contain two equal edges? '),
    (containTwoEqualEdges(jessica) -> write('Yes'), nl; write('No'), nl).

% Test Cases for containRightAngle(Shape)
:- write('Q19: List all polygons that contain a right angle: '),
    (findall(Polygon, containRightAngle(Polygon), Polygons), list_to_set(Polygons, UniquePolygons)),
    (UniquePolygons = [] -> write('No polygons contain a right angle'), nl; write(UniquePolygons), nl).

:- write('Q20: Does Jacob contain a right angle? '),
    (containRightAngle(jacob) -> write('Yes'), nl; write('No'), nl).

:- write('Q21: Does Lee contain a right angle? '),
    (containRightAngle(lee) -> write('Yes'), nl; write('No'), nl).

% Test Cases for containParalellEdges(Shape)
:- write('Q22: Are there any polygons with parallel edges? '),
    (findall(Polygon, containParalellEdges(Polygon), Polygons), list_to_set(Polygons, UniquePolygons)),
    (UniquePolygons = [] -> write('No'), nl; write('Yes'), nl).

:- write('Q23: Does Susan contain parallel edges? '),
    (containParalellEdges(susan) -> write('Yes'), nl; write('No'), nl).

:- write('Q24: Does Smith contain parallel edges? '),
    (containParalellEdges(smith) -> write('Yes'), nl; write('No'), nl).

% Test Cases for hasOrthogonalDiagonals(Shape)
:- write('Q25: How many polygons have orthogonal diagonals? '),
        (findall(Polygon, hasOrthogonalDiagonals(Polygon), Polygons), length(Polygons, NumPolygons)),
        write(NumPolygons), nl.

:- write('Q26: Does Charlotte have orthogonal diagonals? '),
    (hasOrthogonalDiagonals(charlotte) -> write('Yes'), nl; write('No'), nl).

:- write('Q27: Are there any polygons that have orthogonal diagonals? '),
    (findall(Polygon, hasOrthogonalDiagonals(Polygon), Polygons), list_to_set(Polygons, UniquePolygons)),
    (UniquePolygons = [] -> write('No'), nl; write('Yes'), nl).

% Test Cases for isTriangle(X)
:- write('Q28: Is Jacob a Triangle? '),
    (isTriangle(jacob) -> write('Yes'), nl; write('No'), nl).

:- write('Q29: Is Megan a Triangle? '),
    (isTriangle(megan) -> write('Yes'), nl; write('No'), nl).

:- write('Q30: Is William a Triangle? '),
    (isTriangle(william) -> write('Yes'), nl; write('No'), nl).

% Test Cases for isQuadrilateral(X)
:- write('Q31: How many polygons are Quadrilaterals? '),
    (findall(Polygon, isQuadrilateral(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q32: Is Ava a Quadrilateral? '),
    (isQuadrilateral(ava) -> write('Yes'), nl; write('No'), nl).

:- write('Q33: Is Susan a Quadrilateral? '),
    (isQuadrilateral(susan) -> write('Yes'), nl; write('No'), nl).

% Test Cases for isRightTriangle(X)
:- write('Q34: How many polygons are Right Triangles? '),
    (findall(Polygon, isRightTriangle(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q35: Is Jacob a Right Triangle? '),
    (isRightTriangle(jacob) -> write('Yes'), nl; write('No'), nl).

:- write('Q36: Is Lee a Right Triangle? '),
    (isRightTriangle(lee) -> write('Yes'), nl; write('No'), nl).

% Test Cases for isIsoscelesTriangle(X)
:- write('Q37: How many polygons are Isosceles Triangles? '),
    (findall(Polygon, isIsoscelesTriangle(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q38: Is Jacob an Isosceles Triangle? '),
    (isIsoscelesTriangle(jacob) -> write('Yes'), nl; write('No'), nl).

:- write('Q39: Is William an Isosceles Triangle? '),
    (isIsoscelesTriangle(william) -> write('Yes'), nl; write('No'), nl).

% Test Cases for isEquilateralTriangle(X)
:- write('Q40: List out all Equilateral Triangles: '),
    (findall(Polygon, isEquilateralTriangle(Polygon), Polygons), list_to_set(Polygons, UniquePolygons)),
    (UniquePolygons = [] -> write('No Equilateral Triangles'), nl; write(UniquePolygons), nl).

:- write('Q41: Is William an Equilateral Triangle? '),
    (isEquilateralTriangle(william) -> write('Yes'), nl; write('No'), nl).

:- write('Q42: Is Emily an Equilateral Triangle? '),
    (isEquilateralTriangle(emily) -> write('Yes'), nl; write('No'), nl).

% Test Cases for isTrapezoid(X)
:- write('Q43: How many polygons are Trapezoids? '),
    (findall(Polygon, isTrapezoid(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q44: Is Ava a Trapezoid? '),
    (isTrapezoid(ava) -> write('Yes'), nl; write('No'), nl).

:- write('Q45: Is Susan a Trapezoid? '),
    (isTrapezoid(susan) -> write('Yes'), nl; write('No'), nl).

% Test Cases for isKite(X)
:- write('Q46: How many polygons are Kites? '),
    (findall(Polygon, isKite(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q47: Is Charlotte a Kite? '),
    (isKite(charlotte) -> write('Yes'), nl; write('No'), nl).

:- write('Q48: List out all Kites: '),
    (findall(Polygon, isKite(Polygon), Polygons), list_to_set(Polygons, UniquePolygons)),
    (UniquePolygons = [] -> write('No Kites'), nl; write(UniquePolygons), nl).

% Test Cases for isRhombus(X)
:- write('Q49: How many polygons are Rhombus? '),
    (findall(Polygon, isRhombus(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q50: Is Charlotte a Rhombus? '),
    (isRhombus(charlotte) -> write('Yes'), nl; write('No'), nl).

:- write('Q51: Is Wilson a Rhombus? '),
    (isRhombus(wilson) -> write('Yes'), nl; write('No'), nl).

% Test Cases for isParallelogram(X)
:- write('Q52: How many polygons are Parallelograms? '),
    (findall(Polygon, isParallelogram(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q53: Is Lee a Parallelogram? '),
    (isParallelogram(lee) -> write('Yes'), nl; write('No'), nl).

:- write('Q54: Is Susan a Parallelogram? '),
    (isParallelogram(susan) -> write('Yes'), nl; write('No'), nl).

% Test Cases for isIsoscelesTrapezoid(X)
:- write('Q55: Are there any Isosceles Trapezoids? '),
    (findall(Polygon, isIsoscelesTrapezoid(Polygon), Polygons), list_to_set(Polygons, UniquePolygons)),
    (UniquePolygons = [] -> write('No'), nl; write('Yes'), nl).

:- write('Q56: Is Jessica an Isosceles Trapezoid? '),
    (isIsoscelesTrapezoid(jessica) -> write('Yes'), nl; write('No'), nl).

:- write('Q57: List out all Isosceles Trapezoids: '),
    (findall(Polygon, isIsoscelesTrapezoid(Polygon), Polygons), list_to_set(Polygons, UniquePolygons)),
    (UniquePolygons = [] -> write('No Isosceles Trapezoids'), nl; write(UniquePolygons), nl).

% Test Cases for isRectangle(X)
:- write('Q58: How many polygons are Rectangles? '),
    (findall(Polygon, isRectangle(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q59: Is Lee a Rectangle? '),
    (isRectangle(lee) -> write('Yes'), nl; write('No'), nl).

:- write('Q60: Is Smith a Rectangle? '),
    (isRectangle(smith) -> write('Yes'), nl; write('No'), nl).

% Test Cases for isSquare(X)
:- write('Q61: How many polygons are Squares? '),
    (findall(Polygon, isSquare(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q62: Is Martin a Square? '),
    (isSquare(martin) -> write('Yes'), nl; write('No'), nl).

:- write('Q63: Is Lee a Square? '),
    (isSquare(lee) -> write('Yes'), nl; write('No'), nl).

% Test Cases for isScaleneTriangle(X)
:- write('Q64: How many polygons are Scalene Triangles? '),
    (findall(Polygon, isScaleneTriangle(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q65: Is Jacob a Scalene Triangle? '),
    (isScaleneTriangle(jacob) -> write('Yes'), nl; write('No'), nl).

:- write('Q66: Is Megan a Scalene Triangle? '),
    (isScaleneTriangle(megan) -> write('Yes'), nl; write('No'), nl).

% Test Cases for isSymmetric(X)
:- write('Q67: How many polygons are Symmetric? '),
    (findall(Polygon, isSymmetric(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q68: Is Martin a Symmetric polygon? '),
    (isSymmetric(martin) -> write('Yes'), nl; write('No'), nl).

:- write('Q69: Is Lee a Symmetric polygon? '),
    (isSymmetric(lee) -> write('Yes'), nl; write('No'), nl).

% Test Cases for isAlwaysCyclic(X)
:- write('Q70: How many polygons are always cyclic? '),
    (findall(Polygon, isAlwaysCyclic(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q71: Is Jacob always cyclic? '),
    (isAlwaysCyclic(jacob) -> write('Yes'), nl; write('No'), nl).

:- write('Q72: List out all polygons that are always cyclic: '),
    (findall(Polygon, isAlwaysCyclic(Polygon), Polygons), list_to_set(Polygons, UniquePolygons)),
    (UniquePolygons = [] -> write('No polygons are always cyclic'), nl; write(UniquePolygons), nl).

% Test Cases for isAlwaysConvex(X)
:- write('Q73: How many polygons are always convex? '),
    (findall(Polygon, isAlwaysConvex(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q74: Is Jacob always convex? '),
    (isAlwaysConvex(jacob) -> write('Yes'), nl; write('No'), nl).

:- write('Q75: List out all polygons that are always convex: '),
    (findall(Polygon, isAlwaysConvex(Polygon), Polygons), list_to_set(Polygons, UniquePolygons)),
    (UniquePolygons = [] -> write('No polygons are always convex'), nl; write(UniquePolygons), nl).

% Test Cases for isAbleConcave(X)
:- write('Q76: How many polygons are able to be concave? '),
    (findall(Polygon, isAbleConcave(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q77: Is Jacob able to be concave? '),
    (isAbleConcave(jacob) -> write('Yes'), nl; write('No'), nl).

:- write('Q78: List out all polygons that are able to be concave: '),
    (findall(Polygon, isAbleConcave(Polygon), Polygons), list_to_set(Polygons, UniquePolygons)),
    (UniquePolygons = [] -> write('No polygons are able to be concave'), nl; write(UniquePolygons), nl).

% Test Cases for isAbleNonCyclic(X)
:- write('Q79: How many polygons are able to be non-cyclic? '),
    (findall(Polygon, isAbleNonCyclic(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q80: Is Jacob able to be non-cyclic? '),
    (isAbleNonCyclic(jacob) -> write('Yes'), nl; write('No'), nl).

:- write('Q81: List out all polygons that are able to be non-cyclic: '),
    (findall(Polygon, isAbleNonCyclic(Polygon), Polygons), list_to_set(Polygons, UniquePolygons)),
    (UniquePolygons = [] -> write('No polygons are able to be non-cyclic'), nl; write(UniquePolygons), nl).

% Test Cases for isNonSymmetric(X)
:- write('Q82: How many polygons are non-symmetric? '),
    (findall(Polygon, isNonSymmetric(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q83: Is Jacob non-symmetric? '),
    (isNonSymmetric(jacob) -> write('Yes'), nl; write('No'), nl).

:- write('Q84: List out all polygons that are non-symmetric: '),
    (findall(Polygon, isNonSymmetric(Polygon), Polygons), list_to_set(Polygons, UniquePolygons)),
    (UniquePolygons = [] -> write('No polygons are non-symmetric'), nl; write(UniquePolygons), nl).

% Test Cases for hasDiagonalsIntersectAtMidpoint(X)
:- write('Q85: How many polygons have diagonals intersect at midpoint? '),
    (findall(Polygon, hasDiagonalsIntersectAtMidpoint(Polygon), Polygons), length(Polygons, NumPolygons)),
    write(NumPolygons), nl.

:- write('Q86: Does Charlotte have diagonals intersect at midpoint? '),
    (hasDiagonalsIntersectAtMidpoint(charlotte) -> write('Yes'), nl; write('No'), nl).

:- write('Q87: List out all polygons that have diagonals intersect at midpoint: '),
    (findall(Polygon, hasDiagonalsIntersectAtMidpoint(Polygon), Polygons), list_to_set(Polygons, UniquePolygons)),
    (UniquePolygons = [] -> write('No polygons have diagonals intersect at midpoint'), nl; write(UniquePolygons), nl).

% Test Cases for isSuccessor(X, Y)
:- write('Q88: Is Thomas a successor of King? '),
    (isSuccessor(thomas, king) -> write('Yes'), nl; write('No'), nl).

:- write('Q89: Is Ava a successor of King? '),
    (isSuccessor(ava, king) -> write('Yes'), nl; write('No'), nl).

:- write('Q90: Is Martin a successor of King? '),
    (isSuccessor(martin, king) -> write('Yes'), nl; write('No'), nl).

:- write('Q91: Is Martin a successor of Thomas? '),
    (isSuccessor(martin, thomas) -> write('Yes'), nl; write('No'), nl).

:- write('Q92: Is Martin a successor of Ava? '),
    (isSuccessor(martin, ava) -> write('Yes'), nl; write('No'), nl).

:- write('Q93: Is Martin a successor of Susan? '),
    (isSuccessor(martin, susan) -> write('Yes'), nl; write('No'), nl).  

:- write('Q93: Is Martin a successor of Susan? '),
    (isSuccessor(martin, susan) -> write('Yes'), nl; write('No'), nl).  

:- write('Q94: Is Martin a successor of Emily? '),
    (isSuccessor(martin, emily) -> write('Yes'), nl; write('No'), nl).

:- write('Q95: Is Martin a successor of Oliver? '),
    (isSuccessor(martin, oliver) -> write('Yes'), nl; write('No'), nl).