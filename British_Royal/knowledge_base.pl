% Base facts
% parent
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
married(charles, camilla).
married(anne, timothy).
married(andrew, sarah).
married(edward, sophie).
married(beatrice, edoardo).
married(eugenie, jack).
married(william, catherine).
married(harry, meghan).
married(zara, mike).
married(philip, elizabeth_ii).
married(camilla, charles).
married(timothy, anne).
married(sarah, andrew).
married(sophie, edward).
married(edoardo, beatrice).
married(jack, eugenie).
married(catherine, william).
married(meghan, harry).
married(mike, zara).
divorced(charles, diana).
divorced(anne, mark).
divorced(andrew, sarah).
divorced(peter, autumn).
divorced(diana, charles).
divorced(mark, anne).
divorced(sarah, andrew).
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
   (findall(Mother, mother(Mother, charles), Mothers), write(Mothers), nl).

:- write('Q2: Who is the father of Beatrice? '),
   (findall(Father, father(Father, beatrice), Fathers), write(Fathers), nl).

:- write('Q3: Who is the father of Harry? '),
   (findall(Father, father(Father, harry), Fathers), write(Fathers), nl).

% Test Cases for deceased(Person)
:- write('Q4: Is Elizabeth II deceased? '),
   (deceased(elizabeth_ii) -> write('Yes'), nl; write('No'), nl).

:- write('Q5: Who is deceased among Elizabeth II, Diana, and Philip? '),
   (findall(DeceasedPerson, (deceased(DeceasedPerson), member(DeceasedPerson, [elizabeth_ii, diana, philip])), Deceased), write(Deceased), nl).

:- write('Q6: Who is deceased: Elizabeth II, Philip, or Charles? '),
   (findall(DeceasedPerson, (deceased(DeceasedPerson), member(DeceasedPerson, [elizabeth_ii, philip, charles])), Deceased), write(Deceased), nl).

% Test Cases for male(Person)
:- write('Q7: Who is male: Charles, Anne, or William? '),
   (findall(MalePerson, (member(MalePerson, [charles, anne, william]), male(MalePerson)), Males), write(Males), nl).

:- write('Q8: Who is the male among Charles, Anne, and Harry? '),
   (findall(MalePerson, (member(MalePerson, [charles, anne, harry]), male(MalePerson)), Males), write(Males), nl).

:- write('Q9: Is Andrew male? '),
   (male(andrew) -> write('Yes'), nl; write('No'), nl).

% Test Cases for married(Person, Person)
:- write('Q10: Who is married to Elizabeth II? '),
   (findall(Spouse, married(elizabeth_ii, Spouse), Spouses), write(Spouses), nl).

:- write('Q11: Who is married to Charles? '),
   (findall(Spouse, married(charles, Spouse), Spouses), write(Spouses), nl).

:- write('Q12: Who is married to Anne? '),
   (findall(Spouse, married(anne, Spouse), Spouses), write(Spouses), nl).

% Test Cases for female(Person)
:- write('Q13: Who is female: Diana, Philip, or William? '),
   (findall(FemalePerson, (member(FemalePerson, [diana, philip, william]), female(FemalePerson)), Females), write(Females), nl).

:- write('Q14: Who is female: Zara, William, or Harry? '),
   (findall(FemalePerson, (member(FemalePerson, [zara, william, harry]), female(FemalePerson)), Females), write(Females), nl).

:- write('Q15: Is Diana female? '),
   (female(diana) -> write('Yes'), nl; write('No'), nl).

% Test Cases for divorced(Person, Person)
:- write('Q16: Who is divorced from Charles? '),
   (findall(Spouse, divorced(charles, Spouse), Exes), write(Exes), nl).

:- write('Q17: Who is divorced from Anne? '),
   (findall(Spouse, divorced(anne, Spouse), Exes), write(Exes), nl).

:- write('Q18: Who is divorced from Andrew? '),
   (findall(Spouse, divorced(andrew, Spouse), Exes), write(Exes), nl).

% Test Cases for husband(Person, Wife)
:- write('Q19: Who is the husband of Elizabeth II? '),
   (findall(Husband, husband(Husband, elizabeth_ii), Husbands), write(Husbands), nl).

:- write('Q20: Who is the husband of Camilla? '),
   (findall(Husband, husband(Husband, camilla), Husbands), write(Husbands), nl).

:- write('Q21: Who is the husband of Anne? '),
   (findall(Husband, husband(Husband, anne), Husbands), write(Husbands), nl).

% Test Cases for wife(Person, Husband)
:- write('Q22: Who is the wife of Philip? '),
   (findall(Wife, wife(Wife, philip), Wives), write(Wives), nl).

:- write('Q23: Who is the wife of Charles? '),
   (findall(Wife, wife(Wife, charles), Wives), write(Wives), nl).

:- write('Q24: Who is the wife of Andrew? '),
   (findall(Wife, wife(Wife, andrew), Wives), write(Wives), nl).

% Test Cases for father(Parent, Child)
:- write('Q25: Who is the father of William? '),
   (findall(Father, father(Father, william), Fathers), write(Fathers), nl).

:- write('Q26: Who is the father of Harry? '),
   (findall(Father, father(Father, harry), Fathers), write(Fathers), nl).

:- write('Q27: Who is the father of Zara? '),
   (findall(Father, father(Father, zara), Fathers), write(Fathers), nl).

% Test Cases for mother(Parent, Child)
:- write('Q28: Who is the mother of William? '),
   (findall(Mother, mother(Mother, william), Mothers), write(Mothers), nl).

:- write('Q29: Who is the mother of Beatrice? '),
   (findall(Mother, mother(Mother, beatrice), Mothers), write(Mothers), nl).

:- write('Q30: Who is the mother of Andrew? '),
   (findall(Mother, mother(Mother, andrew), Mothers), write(Mothers), nl).

% Test Cases for child(Child, Parent)
:- write('Q31: Who is the child of Elizabeth II? '),
   (findall(Child, child(Child, elizabeth_ii), Children), write(Children), nl).

:- write('Q32: Who is the child of Philip? '),
   (findall(Child, child(Child, philip), Children), write(Children), nl).

:- write('Q33: Who are the children of Diana? '),
   (findall(Child, child(Child, diana), Children), write(Children), nl).

% Test Cases for son(Child, Parent)
:- write('Q34: Who is the son of Elizabeth II? '),
   (findall(Son, son(Son, elizabeth_ii), Sons), write(Sons), nl).

:- write('Q35: Who is the son of Philip? '),
   (findall(Son, son(Son, philip), Sons), write(Sons), nl).

:- write('Q36: Who is the son of Diana? '),
   (findall(Son, son(Son, diana), Sons), write(Sons), nl).

% Test Cases for daughter(Child, Parent)
:- write('Q37: Who is the daughter of Elizabeth II? '),
   (findall(Daughter, daughter(Daughter, elizabeth_ii), Daughters), write(Daughters), nl).

:- write('Q38: Who is the daughter of Philip? '),
   (findall(Daughter, daughter(Daughter, philip), Daughters), write(Daughters), nl).

:- write('Q39: Who is the daughter of Diana? '),
   (findall(Daughter, daughter(Daughter, diana), Daughters), write(Daughters), nl).

% Test Cases for grandparent(GP, GC)
:- write('Q40: Who is the grandparent of William? '),
   (findall(GP, grandparent(GP, william), Grandparents), write(Grandparents), nl).

:- write('Q41: Who is the grandparent of Beatrice? '),
   (findall(GP, grandparent(GP, beatrice), Grandparents), write(Grandparents), nl).

:- write('Q42: Who is the grandparent of Zara? '),
   (findall(GP, grandparent(GP, zara), Grandparents), write(Grandparents), nl).

% Test Cases for grandmother(GM, GC)
:- write('Q43: Who is the grandmother of William? '),
   (findall(GM, grandmother(GM, william), Grandmothers), write(Grandmothers), nl).

:- write('Q44: Who is the grandmother of Beatrice? '),
   (findall(GM, grandmother(GM, beatrice), Grandmothers), write(Grandmothers), nl).

:- write('Q45: Who is the grandmother of Zara? '),
   (findall(GM, grandmother(GM, zara), Grandmothers), write(Grandmothers), nl).

% Test Cases for grandfather(GF, GC)
:- write('Q46: Who is the grandfather of William? '),
   (findall(GF, grandfather(GF, william), Grandfathers), write(Grandfathers), nl).

:- write('Q47: Who is the grandfather of Beatrice? '),
   (findall(GF, grandfather(GF, beatrice), Grandfathers), write(Grandfathers), nl).

:- write('Q48: Who is the grandfather of Zara? '),
   (findall(GF, grandfather(GF, zara), Grandfathers), write(Grandfathers), nl).

% Test Cases for grandchild(GC, GP)
:- write('Q49: Who is the grandchild of Elizabeth II? '),
   (findall(GC, grandchild(GC, elizabeth_ii), Grandchildren), write(Grandchildren), nl).

:- write('Q50: Who is the grandchild of Diana? '),
   (findall(GC, grandchild(GC, diana), Grandchildren), write(Grandchildren), nl).

:- write('Q51: Who is the grandchild of Philip? '),
   (findall(GC, grandchild(GC, philip), Grandchildren), write(Grandchildren), nl).

% Test Cases for grandson(GS, GP)
:- write('Q52: Who is the grandson of Elizabeth II? '),
   (findall(GS, grandson(GS, elizabeth_ii), Grandsons), write(Grandsons), nl).

:- write('Q53: Who is the grandson of Diana? '),
   (findall(GS, grandson(GS, diana), Grandsons), write(Grandsons), nl).

:- write('Q54: Who is the grandson of Philip? '),
   (findall(GS, grandson(GS, philip), Grandsons), write(Grandsons), nl).

% Test Cases for granddaughter(GD, GP)
:- write('Q55: Who is the granddaughter of Elizabeth II? '),
   (findall(GD, granddaughter(GD, elizabeth_ii), Granddaughters), write(Granddaughters), nl).

:- write('Q56: Who is the granddaughter of Diana? '),
   (findall(GD, granddaughter(GD, diana), Granddaughters), write(Granddaughters), nl).

:- write('Q57: Who is the granddaughter of Philip? '),
   (findall(GD, granddaughter(GD, philip), Granddaughters), write(Granddaughters), nl).

% Test Cases for sibling(Person1, Person2)
:- write('Q58: Who is the sibling of Charles? '),
   (findall(Sibling, sibling(charles, Sibling), Siblings), write(Siblings), nl).

:- write('Q59: Who is the sibling of Anne? '),
   (findall(Sibling, sibling(anne, Sibling), Siblings), write(Siblings), nl).

:- write('Q60: Who is the sibling of Edward? '),
   (findall(Sibling, sibling(edward, Sibling), Siblings), write(Siblings), nl).

% Test Cases for brother(Person, Sibling)
:- write('Q61: Who is the brother of Anne? '),
   (findall(Brother, brother(Brother, anne), Brothers), write(Brothers), nl).

:- write('Q62: Who is the brother of Sarah? '),
   (findall(Brother, brother(Brother, sarah), Brothers), write(Brothers), nl).

:- write('Q63: Who is the brother of Beatrice? '),
   (findall(Brother, brother(Brother, beatrice), Brothers), write(Brothers), nl).

% Test Cases for sister(Person, Sibling)
:- write('Q64: Who is the sister of William? '),
   (findall(Sister, sister(Sister, william), Sisters), write(Sisters), nl).

:- write('Q65: Who is the sister of Charles? '),
   (findall(Sister, sister(Sister, charles), Sisters), write(Sisters), nl).

:- write('Q66: Who is the sister of Edward? '),
   (findall(Sister, sister(Sister, edward), Sisters), write(Sisters), nl).

% Test Cases for aunt(Person, NieceNephew)
:- write('Q67: Who is the aunt of Beatrice? '),
   (findall(Aunt, aunt(Aunt, beatrice), Aunts), write(Aunts), nl).

:- write('Q68: Who is the aunt of Sienna? '),
   (findall(Aunt, aunt(Aunt, sienna), Aunts), write(Aunts), nl).

:- write('Q69: Who is the aunt of Eugenie? '),
   (findall(Aunt, aunt(Aunt, eugenie), Aunts), write(Aunts), nl).

% Test Cases for uncle(Person, NieceNephew)
:- write('Q70: Who is the uncle of Beatrice? '),
   (findall(Uncle, uncle(Uncle, beatrice), Uncles), write(Uncles), nl).

:- write('Q71: Who is the uncle of Sienna? '),
   (findall(Uncle, uncle(Uncle, sienna), Uncles), write(Uncles), nl).

:- write('Q72: Who is the uncle of Eugenie? '),
   (findall(Uncle, uncle(Uncle, eugenie), Uncles), write(Uncles), nl).

% Test Cases for niece(Person, AuntUncle)
:- write('Q73: Who is the niece of Anne? '),
   (findall(Niece, niece(Niece, anne), Nieces), write(Nieces), nl).

:- write('Q74: Who is the niece of Sarah? '),
   (findall(Niece, niece(Niece, sarah), Nieces), write(Nieces), nl).

:- write('Q75: Who is the niece of Beatrice? '),
   (findall(Niece, niece(Niece, beatrice), Nieces), write(Nieces), nl).

% Test Cases for nephew(Person, AuntUncle)
:- write('Q76: Who is the nephew of Anne? '),
   (findall(Nephew, nephew(Nephew, anne), Nephews), write(Nephews), nl).

:- write('Q77: Who is the nephew of Sarah? '),
   (findall(Nephew, nephew(Nephew, sarah), Nephews), write(Nephews), nl).

:- write('Q78: Who is the nephew of Beatrice? '),
   (findall(Nephew, nephew(Nephew, beatrice), Nephews), write(Nephews), nl).

