% Base facts
% Parents
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

parent(beatrice, sienna).
parent(edoardo, sienna).

parent(eugenie, august).
parent(jack, august).

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
male(mark).
male(andrew).
male(edward).
male(timothy).
male(edoardo).
male(jack).
male(august).
male(james).
male(william).
male(harry).
male(peter).
male(mike).
male(george).
male(louis).
male(archie).
male(lucas).

female(elizabeth_ii).
female(diana).
female(anne).
female(sarah).
female(sophie).
female(camilla).
female(beatrice).
female(eugenie).
female(louise).
female(sienna).
female(catherine).
female(meghan).
female(autumn).
female(zara).
female(charlotte).
female(lilibet).
female(savannah).
female(isla).
female(mia).
female(lena).

% Marriages
married(elizabeth_ii, philip).
married(philip, elizabeth_ii).

married(charles, camilla).
married(camilla, charles).

married(anne, timothy).
married(timothy, anne).

married(andrew, sarah).
married(sarah, andrew).

married(edward, sophie).
married(sophie, edward).

married(beatrice, edoardo).
married(edoardo, beatrice).

married(eugenie, jack).
married(jack, eugenie).

married(william, catherine).
married(catherine, william).

married(harry, meghan).
married(meghan, harry).

married(zara, mike).
married(mike, zara).

divorced(charles, diana).
divorced(diana, charles).
divorced(anne, mark).
divorced(mark, anne).
divorced(andrew, sarah).
divorced(sarah, andrew).
divorced(peter, autumn).
divorced(autumn, peter).

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
% Test Cases for parent(Parent, Child)
:- write('Q1: Who is the mother of Charles? '),
   (findall(Mother, mother(Mother, charles), Mothers), list_to_set(Mothers, UniqueMothers), 
    (UniqueMothers = [] -> write('not found'), nl; write(UniqueMothers), nl)).

:- write('Q2: Who is the father of Beatrice? '),
   (findall(Father, father(Father, beatrice), Fathers), list_to_set(Fathers, UniqueFathers), 
    (UniqueFathers = [] -> write('not found'), nl; write(UniqueFathers), nl)).

:- write('Q3: Who is the father of Harry? '),
   (findall(Father, father(Father, harry), Fathers), list_to_set(Fathers, UniqueFathers), 
    (UniqueFathers = [] -> write('not found'), nl; write(UniqueFathers), nl)).

% Test Cases for deceased(Person)
:- write('Q4: Is Elizabeth II deceased? '),
   (deceased(elizabeth_ii) -> write('Yes'), nl; write('No'), nl).

:- write('Q5: Who is deceased among Elizabeth II, Diana, and Philip? '),
   (findall(DeceasedPerson, (deceased(DeceasedPerson), member(DeceasedPerson, [elizabeth_ii, diana, philip])), Deceased), 
    list_to_set(Deceased, UniqueDeceased), 
    (UniqueDeceased = [] -> write('No one'), nl; write(UniqueDeceased), nl)).

:- write('Q6: Who is deceased: Elizabeth II, Philip, or Charles? '),
   (findall(DeceasedPerson, (deceased(DeceasedPerson), member(DeceasedPerson, [elizabeth_ii, philip, charles])), Deceased), 
    list_to_set(Deceased, UniqueDeceased), 
    (UniqueDeceased = [] -> write('not found'), nl; write(UniqueDeceased), nl)).

% Test Cases for male(Person)
:- write('Q7: Who is male: Charles, Anne, or William? '),
   (findall(MalePerson, (member(MalePerson, [charles, anne, william]), male(MalePerson)), Males), 
    (Males = [] -> write('not found'), nl; write(Males), nl)).

:- write('Q8: Who is the male among Charles, Anne, and Harry? '),
   (findall(MalePerson, (member(MalePerson, [charles, anne, harry]), male(MalePerson)), Males), 
    (Males = [] -> write('No'), nl; write(Males), nl)).

:- write('Q9: Is Andrew male? '),
   (male(andrew) -> write('Yes'), nl; write('No'), nl).

% Test Cases for married(Person, Person)
:- write('Q10: Who is married to Elizabeth II? '),
   (findall(Spouse, married(elizabeth_ii, Spouse), Spouses), 
    (Spouses = [] -> write('not found'), nl; write(Spouses), nl)).

:- write('Q11: Who is married to Charles? '),
   (findall(Spouse, married(charles, Spouse), Spouses), 
    (Spouses = [] -> write('not found'), nl; write(Spouses), nl)).

:- write('Q12: Who is married to Anne? '),
   (findall(Spouse, married(anne, Spouse), Spouses), 
    (Spouses = [] -> write('not found'), nl; write(Spouses), nl)).

% Test Cases for female(Person)
:- write('Q13: Who is female: Diana, Philip, or William? '),
   (findall(FemalePerson, (member(FemalePerson, [diana, philip, william]), female(FemalePerson)), Females), 
    (Females = [] -> write('not found'), nl; write(Females), nl)).

:- write('Q14: Who is female: Zara, William, or Harry? '),
   (findall(FemalePerson, (member(FemalePerson, [zara, william, harry]), female(FemalePerson)), Females), 
    (Females = [] -> write('not found'), nl; write(Females), nl)).

:- write('Q15: Is Diana female? '),
   (female(diana) -> write('Yes'), nl; write('No'), nl).

% Test Cases for divorced(Person, Person)
:- write('Q16: Who is divorced from Charles? '),
   (findall(Spouse, divorced(charles, Spouse), Exes), 
    (Exes = [] -> write('not found'), nl; write(Exes), nl)).

:- write('Q17: Who is divorced from Anne? '),
   (findall(Spouse, divorced(anne, Spouse), Exes), 
    (Exes = [] -> write('not found'), nl; write(Exes), nl)).

:- write('Q18: Who is divorced from Andrew? '),
   (findall(Spouse, divorced(andrew, Spouse), Exes), 
    (Exes = [] -> write('not found'), nl; write(Exes), nl)).

% Test Cases for husband(Person, Wife)
:- write('Q19: Who is the husband of Elizabeth II? '),
   (findall(Husband, husband(Husband, elizabeth_ii), Husbands), 
    (Husbands = [] -> write('not found'), nl; write(Husbands), nl)).

:- write('Q20: Who is the husband of Camilla? '),
   (findall(Husband, husband(Husband, camilla), Husbands), 
    (Husbands = [] -> write('not found'), nl; write(Husbands), nl)).

:- write('Q21: Who is the husband of Anne? '),
   (findall(Husband, husband(Husband, anne), Husbands), 
    (Husbands = [] -> write('not found'), nl; write(Husbands), nl)).

% Test Cases for wife(Person, Husband)
:- write('Q22: Who is the wife of Philip? '),
   (findall(Wife, wife(Wife, philip), Wives), 
    (Wives = [] -> write('not found'), nl; write(Wives), nl)).

:- write('Q23: Who is the wife of Charles? '),
   (findall(Wife, wife(Wife, charles), Wives), 
    (Wives = [] -> write('not found'), nl; write(Wives), nl)).

:- write('Q24: Who is the wife of Andrew? '),
   (findall(Wife, wife(Wife, andrew), Wives), 
    (Wives = [] -> write('not found'), nl; write(Wives), nl)).

% Test Cases for father(Parent, Child)
:- write('Q25: Who is the father of William? '),
   (findall(Father, father(Father, william), Fathers), 
    (Fathers = [] -> write('not found'), nl; write(Fathers), nl)).

:- write('Q26: Who is the father of Harry? '),
   (findall(Father, father(Father, harry), Fathers), 
    (Fathers = [] -> write('not found'), nl; write(Fathers), nl)).

:- write('Q27: Who is the father of Zara? '),
   (findall(Father, father(Father, zara), Fathers), 
    (Fathers = [] -> write('not found'), nl; write(Fathers), nl)).

% Test Cases for mother(Parent, Child)
:- write('Q28: Who is the mother of William? '),
   (findall(Mother, mother(Mother, william), Mothers), 
    (Mothers = [] -> write('not found'), nl; write(Mothers), nl)).

:- write('Q29: Who is the mother of Beatrice? '),
   (findall(Mother, mother(Mother, beatrice), Mothers), 
    (Mothers = [] -> write('not found'), nl; write(Mothers), nl)).

:- write('Q30: Who is the mother of Andrew? '),
   (findall(Mother, mother(Mother, andrew), Mothers), 
    (Mothers = [] -> write('not found'), nl; write(Mothers), nl)).

% Test Cases for child(Child, Parent)
:- write('Q31: Who is the child of Elizabeth II? '),
   (findall(Child, child(Child, elizabeth_ii), Children), 
    (Children = [] -> write('not found'), nl; write(Children), nl)).

:- write('Q32: Who is the child of Philip? '),
   (findall(Child, child(Child, philip), Children), 
    (Children = [] -> write('not found'), nl; write(Children), nl)).

:- write('Q33: Who is the child of Charles? '),
   (findall(Child, child(Child, charles), Children), 
    (Children = [] -> write('not found'), nl; write(Children), nl)).

% Test Cases for son(Child, Parent)
:- write('Q34: Who are the sons of Elizabeth II? '),
   (findall(Son, son(Son, elizabeth_ii), Sons), 
    (Sons = [] -> write('not found'), nl; sort(Sons, Sorted), write(Sorted), nl)).

:- write('Q35: How many sons does Philip have? '),
   (findall(Son, son(Son, philip), Sons), 
    (Sons = [] -> write('0'), nl; length(Sons, Count), write(Count), nl)).

:- write('Q36: Which son of Diana is also the son of Charles? '),
   (findall(Son, (son(Son, diana), son(Son, charles)), Sons), 
    (Sons = [] -> write('not found'), nl; sort(Sons, Sorted), write(Sorted), nl)).

% Test Cases for daughter(Child, Parent)
:- write('Q37: Who is the daughter of Elizabeth II? '),
   (findall(Daughter, daughter(Daughter, elizabeth_ii), Daughters), 
    (Daughters = [] -> write('not found'), nl; sort(Daughters, Sorted), write(Sorted), nl)).

:- write('Q38: Are there any daughters of Philip? '),
   (findall(Daughter, daughter(Daughter, philip), Daughters), 
    (Daughters = [] -> write('No'), nl; write('Yes'), nl)).

:- write('Q39: How many daughters does Diana have? '),
   (findall(Daughter, daughter(Daughter, diana), Daughters), 
    (Daughters = [] -> write('0'), nl; length(Daughters, Count), write(Count), nl)).

% Test Cases for grandparent(GP, GC)
:- write('Q40: Who are the grandparents of William? '),
   (findall(GP, grandparent(GP, william), Grandparents), 
    (Grandparents = [] -> write('not found'), nl; sort(Grandparents, Sorted), write(Sorted), nl)).

:- write('Q41: Which grandparents does Beatrice have? '),
   (findall(GP, grandparent(GP, beatrice), Grandparents), 
    (Grandparents = [] -> write('not found'), nl; sort(Grandparents, Sorted), write(Sorted), nl)).

:- write('Q42: How many grandparents does Zara have? '),
   (findall(GP, grandparent(GP, zara), Grandparents), 
    (Grandparents = [] -> write('0'), nl; length(Grandparents, Count), write(Count), nl)).

% Test Cases for grandmother(GM, GC)
:- write('Q43: Which grandmother is related to William? '),
   (findall(GM, grandmother(GM, william), Grandmothers), 
    (Grandmothers = [] -> write('not found'), nl; sort(Grandmothers, Sorted), write(Sorted), nl)).

:- write('Q44: Who is the grandmother of Beatrice? '),
   (findall(GM, grandmother(GM, beatrice), Grandmothers), 
    (Grandmothers = [] -> write('not found'), nl; sort(Grandmothers, Sorted), write(Sorted), nl)).

:- write('Q45: How many grandmothers does Zara have? '),
   (findall(GM, grandmother(GM, zara), Grandmothers), 
    (Grandmothers = [] -> write('0'), nl; length(Grandmothers, Count), write(Count), nl)).

% Test Cases for grandfather(GF, GC)
:- write('Q46: Who is the grandfather of William? '),
   (findall(GF, grandfather(GF, william), Grandfathers), 
    (Grandfathers = [] -> write('not found'), nl; sort(Grandfathers, Sorted), write(Sorted), nl)).

:- write('Q47: How many grandfathers does Beatrice have? '),
   (findall(GF, grandfather(GF, beatrice), Grandfathers), 
    (Grandfathers = [] -> write('0'), nl; length(Grandfathers, Count), write(Count), nl)).

:- write('Q48: Are there any grandfathers of Zara? '),
   (findall(GF, grandfather(GF, zara), Grandfathers), 
    (Grandfathers = [] -> write('No'), nl; write('Yes'), nl)).

% Test Cases for grandchild(GC, GP)
:- write('Q49: How many grandchildren does Elizabeth II have? '),
   (findall(GC, grandchild(GC, elizabeth_ii), Grandchildren), 
    (Grandchildren = [] -> write('not found'), nl; length(Grandchildren, Count), write(Count), nl)).

:- write('Q50: Which grandchildren are related to Diana? '),
   (findall(GC, grandchild(GC, diana), Grandchildren), 
    (Grandchildren = [] -> write('not found'), nl; sort(Grandchildren, Sorted), write(Sorted), nl)).

:- write('Q51: Who is the grandchild of Philip? '),
   (findall(GC, grandchild(GC, philip), Grandchildren), 
    (Grandchildren = [] -> write('not found'), nl; sort(Grandchildren, Sorted), write(Sorted), nl)).

% Test Cases for grandson(GS, GP)
:- write('Q52: Who is the grandson of Elizabeth II? '),
   (findall(GS, grandson(GS, elizabeth_ii), Grandsons), 
    (Grandsons = [] -> write('not found'), nl; sort(Grandsons, Sorted), write(Sorted), nl)).

:- write('Q53: Are there any grandsons of Diana? '),
   (findall(GS, grandson(GS, diana), Grandsons), 
    (Grandsons = [] -> write('No'), nl; write('Yes'), nl)).

:- write('Q54: How many grandsons does Philip have? '),
   (findall(GS, grandson(GS, philip), Grandsons), 
    (Grandsons = [] -> write('0'), nl; length(Grandsons, Count), write(Count), nl)).

% Test Cases for granddaughter(GD, GP)
:- write('Q55: Which granddaughter is related to Elizabeth II? '),
   (findall(GD, granddaughter(GD, elizabeth_ii), Granddaughters), 
    (Granddaughters = [] -> write('not found'), nl; sort(Granddaughters, Sorted), write(Sorted), nl)).

:- write('Q56: Who are the granddaughters of Diana? '),
   (findall(GD, granddaughter(GD, diana), Granddaughters), 
    (Granddaughters = [] -> write('not found'), nl; sort(Granddaughters, Sorted), write(Sorted), nl)).

:- write('Q57: How many granddaughters does Philip have? '),
   (findall(GD, granddaughter(GD, philip), Granddaughters), 
    (Granddaughters = [] -> write('0'), nl; length(Granddaughters, Count), write(Count), nl)).

% Test Cases for sibling(Person1, Person2)
:- write('Q58: Are Charles and Anne siblings? '),
   (sibling(charles, anne) -> write('Yes'), nl; write('No'), nl).

:- write('Q59: How many siblings does Edward have? '),
   (findall(Sibling, sibling(edward, Sibling), Siblings), 
    (Siblings = [] -> write('0'), nl; length(Siblings, Count), write(Count), nl)).

:- write('Q60: Who are the siblings of Charles? '),
   (findall(Sibling, sibling(charles, Sibling), Siblings), 
    (Siblings = [] -> write('not found'), nl; sort(Siblings, Sorted), write(Sorted), nl)).

% Test Cases for brother(Person, Sibling)
:- write('Q61: Who is the brother of Anne? '),
   (findall(Brother, brother(Brother, anne), Brothers), 
    (Brothers = [] -> write('not found'), nl; sort(Brothers, Sorted), write(Sorted), nl)).

:- write('Q62: How many brothers does Beatrice have? '),
   (findall(Brother, brother(Brother, beatrice), Brothers), 
    (Brothers = [] -> write('0'), nl; length(Brothers, Count), write(Count), nl)).

:- write('Q63: Are there any brothers of Sarah? '),
   (findall(Brother, brother(Brother, sarah), Brothers), 
    (Brothers = [] -> write('No'), nl; write('Yes'), nl)).

% Test Cases for sister(Person, Sibling)
:- write('Q64: Who is the sister of William? '),
   (findall(Sister, sister(Sister, william), Sisters), 
    (Sisters = [] -> write('not found'), nl; sort(Sisters, Sorted), write(Sorted), nl)).

:- write('Q65: How many sisters does Charles have? '),
   (findall(Sister, sister(Sister, charles), Sisters), 
    (Sisters = [] -> write('0'), nl; length(Sisters, Count), write(Count), nl)).

:- write('Q66: Who are the sisters of Edward? '),
   (findall(Sister, sister(Sister, edward), Sisters), 
    (Sisters = [] -> write('not found'), nl; sort(Sisters, Sorted), write(Sorted), nl)).

% Test Cases for aunt(Person, NieceNephew)
:- write('Q67: Who is the aunt of Beatrice? '),
   (findall(Aunt, aunt(Aunt, beatrice), Aunts), 
    (Aunts = [] -> write('not found'), nl; sort(Aunts, Sorted), write(Sorted), nl)).

:- write('Q68: Who is the aunt of Sienna? '),
   (findall(Aunt, aunt(Aunt, sienna), Aunts), 
    (Aunts = [] -> write('not found'), nl; sort(Aunts, Sorted), write(Sorted), nl)).

:- write('Q69: Which aunt is related to Eugenie? '),
   (findall(Aunt, aunt(Aunt, eugenie), Aunts), 
    (Aunts = [] -> write('not found'), nl; sort(Aunts, Sorted), write(Sorted), nl)).

:- write('Q70: Are there any aunts of Beatrice? '),
   (findall(Aunt, aunt(Aunt, beatrice), Aunts), 
    (Aunts = [] -> write('No'), nl; write('Yes'), nl)).

:- write('Q71: How many aunts does Sienna have? '),
   (findall(Aunt, aunt(Aunt, sienna), Aunts), 
    (Aunts = [] -> write('0'), nl; length(Aunts, Count), write(Count), nl)).

% Test Cases for uncle(Person, NieceNephew)
:- write('Q72: Who is the uncle of Beatrice? '),
   (findall(Uncle, uncle(Uncle, beatrice), Uncles), 
    (Uncles = [] -> write('not found'), nl; sort(Uncles, Sorted), write(Sorted), nl)).

:- write('Q73: Who is the uncle of Sienna? '),
   (findall(Uncle, uncle(Uncle, sienna), Uncles), 
    (Uncles = [] -> write('not found'), nl; sort(Uncles, Sorted), write(Sorted), nl)).

:- write('Q74: Which uncle is related to Eugenie? '),
   (findall(Uncle, uncle(Uncle, eugenie), Uncles), 
    (Uncles = [] -> write('not found'), nl; sort(Uncles, Sorted), write(Sorted), nl)).

:- write('Q75: Are there any uncles of Beatrice? '),
   (findall(Uncle, uncle(Uncle, beatrice), Uncles), 
    (Uncles = [] -> write('No'), nl; write('Yes'), nl)).

:- write('Q76: How many uncles does Sienna have? '),
   (findall(Uncle, uncle(Uncle, sienna), Uncles), 
    (Uncles = [] -> write('0'), nl; length(Uncles, Count), write(Count), nl)).

% Test Cases for niece(Person, AuntUncle)
:- write('Q77: Who is the niece of Anne? '),
   (findall(Niece, niece(Niece, anne), Nieces), 
    (Nieces = [] -> write('not found'), nl; sort(Nieces, Sorted), write(Sorted), nl)).

:- write('Q78: Who is the niece of Sarah? '),
   (findall(Niece, niece(Niece, sarah), Nieces), 
    (Nieces = [] -> write('not found'), nl; sort(Nieces, Sorted), write(Sorted), nl)).

:- write('Q79: Which niece is related to Beatrice? '),
   (findall(Niece, niece(Niece, beatrice), Nieces), 
    (Nieces = [] -> write('not found'), nl; sort(Nieces, Sorted), write(Sorted), nl)).

:- write('Q80: How many nieces does Anne have? '),
   (findall(Niece, niece(Niece, anne), Nieces), 
    (Nieces = [] -> write('0'), nl; length(Nieces, Count), write(Count), nl)).

:- write('Q81: Are there any nieces of Sarah? '),
   (findall(Niece, niece(Niece, sarah), Nieces), 
    (Nieces = [] -> write('No'), nl; write('Yes'), nl)).

% Test Cases for nephew(Person, AuntUncle)
:- write('Q82: Who is the nephew of Anne? '),
   (findall(Nephew, nephew(Nephew, anne), Nephews), 
    (Nephews = [] -> write('not found'), nl; sort(Nephews, Sorted), write(Sorted), nl)).

:- write('Q83: Who is the nephew of Sarah? '),
   (findall(Nephew, nephew(Nephew, sarah), Nephews), 
    (Nephews = [] -> write('not found'), nl; sort(Nephews, Sorted), write(Sorted), nl)).

:- write('Q84: Which nephew is related to Beatrice? '),
   (findall(Nephew, nephew(Nephew, beatrice), Nephews), 
    (Nephews = [] -> write('not found'), nl; sort(Nephews, Sorted), write(Sorted), nl)).

:- write('Q85: How many nephews does Anne have? '),
   (findall(Nephew, nephew(Nephew, anne), Nephews), 
    (Nephews = [] -> write('0'), nl; length(Nephews, Count), write(Count), nl)).

:- write('Q86: Are there any nephews of Sarah? '),
   (findall(Nephew, nephew(Nephew, sarah), Nephews), 
    (Nephews = [] -> write('No'), nl; write('Yes'), nl)).
