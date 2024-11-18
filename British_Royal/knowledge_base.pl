% Base facts
parent(elizabeth_ii, charles).
parent(elizabeth_ii, anne).
parent(elizabeth_ii, andrew).
parent(elizabeth_ii, edward).
parent(philip, charles).
parent(philip, anne).
parent(philip, andrew).
parent(philip, edward).

parent(charles, william).
parent(charles, harry).
parent(diana, william).
parent(diana, harry).

parent(anne, peter).
parent(anne, zara).
parent(mark, peter).
parent(mark, zara).

parent(andrew, beatrice).
parent(andrew, eugenie).
parent(sarah, beatrice).
parent(sarah, eugenie).

parent(edward, louise).
parent(edward, james).
parent(sophie, louise).
parent(sophie, james).

parent(william, george).
parent(william, charlotte).
parent(william, louis).
parent(catherine, george).
parent(catherine, charlotte).
parent(catherine, louis).

parent(harry, archie).
parent(harry, lilibet).
parent(meghan, archie).
parent(meghan, lilibet).

parent(peter, savannah).
parent(peter, isla).
parent(autumn, savannah).
parent(autumn, isla).

parent(zara, mia).
parent(zara, lena).
parent(zara, lucas).
parent(mike, mia).
parent(mike, lena).
parent(mike, lucas).

% Deceased
deceased(elizabeth_ii).
deceased(philip).
deceased(diana).

% Genders
male(philip).
male(charles).
male(andrew).
male(edward).
male(william).
male(harry).
male(peter).
male(mike).
male(james).
male(george).
male(louis).
male(archie).
male(lucas).

female(elizabeth_ii).
female(diana).
female(anne).
female(sarah).
female(sophie).
female(catherine).
female(meghan).
female(beatrice).
female(eugenie).
female(louise).
female(charlotte).
female(savannah).
female(isla).
female(zara).
female(mia).
female(lena).
female(lilibet).

% Marriages
married(elizabeth_ii, philip).
married(charles, camilla).
married(anne, timothy).
married(andrew, sarah).
married(edward, sophie).
married(william, catherine).
married(harry, meghan).
married(zara, mike).
divorced(charles, diana).
divorced(anne, mark).
divorced(andrew, sarah).
divorced(peter, autumn).

% Derived predicates
husband(Person, Wife) :- male(Person), married(Person, Wife).
wife(Person, Husband) :- female(Person), married(Person, Husband).
father(Parent, Child) :- male(Parent), parent(Parent, Child).
mother(Parent, Child) :- female(Parent), parent(Parent, Child).
child(Child, Parent) :- parent(Parent, Child).
son(Child, Parent) :- male(Child), parent(Parent, Child).
daughter(Child, Parent) :- female(Child), parent(Parent, Child).
grandparent(GP, GC) :- parent(GP, X), parent(X, GC).
grandmother(GM, GC) :- female(GM), grandparent(GM, GC).
grandfather(GF, GC) :- male(GF), grandparent(GF, GC).
grandchild(GC, GP) :- grandparent(GP, GC).
grandson(GS, GP) :- male(GS), grandchild(GS, GP).
granddaughter(GD, GP) :- female(GD), grandchild(GD, GP).
sibling(Person1, Person2) :- parent(Parent, Person1), parent(Parent, Person2), Person1 \= Person2.
brother(Person, Sibling) :- male(Person), sibling(Person, Sibling).
sister(Person, Sibling) :- female(Person), sibling(Person, Sibling).
aunt(Person, NieceNephew) :- female(Person), sibling(Person, Parent), parent(Parent, NieceNephew).
uncle(Person, NieceNephew) :- male(Person), sibling(Person, Parent), parent(Parent, NieceNephew).
niece(Person, AuntUncle) :- female(Person), parent(Parent, Person), sibling(Parent, AuntUncle).
nephew(Person, AuntUncle) :- male(Person), parent(Parent, Person), sibling(Parent, AuntUncle).


% Test Cases
:- write('Q1: Is Charles the father of William? '),
   (father(charles, william) -> write('Yes'), nl; write('No'), nl).

:- write('Q2: Is Elizabeth II the grandmother of George? '),
   (grandmother(elizabeth_ii, george) -> write('Yes'), nl; write('No'), nl).

:- write('Q3: Is William the brother of Harry? '),
   (brother(william, harry) -> write('Yes'), nl; write('No'), nl).