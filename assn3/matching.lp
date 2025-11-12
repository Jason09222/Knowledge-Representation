%student(jane).
%student(kurt).
%student(lisa).
%student(maud).
%school(randwick).
%school(maroubra).
%schoolRank(randwick, jane, 1).
%schoolRank(randwick, kurt, 2).
%schoolRank(randwick, lisa, 3).
%schoolRank(randwick, maud, 4).
%schoolRank(maroubra, jane, 1).
%schoolRank(maroubra, maud, 2).
%schoolRank(maroubra, lisa, 3).
%schoolRank(maroubra, kurt, 4).
%studentRank(jane, maroubra, 1).
%studentRank(kurt, randwick, 1). 
%studentRank(kurt, maroubra, 2).
%studentRank(lisa, randwick, 1). 
%studentRank(lisa, maroubra, 2).
%studentRank(maud, randwick, 1).
%quota(randwick, 2).
%quota(maroubra, 2).

% form school and student by studentRank and schoolRank
student(A) :- studentRank(A, I, X).
school(I) :- schoolRank(I, A, Y).

% genertor
{ match(I, A) : school(I), studentRank(A, I, X) } :- student(A).

% Each school can only accept at most Y(quota(I, Y)) students.
:- C = #count { A : match(I, A) }, school(I), quota(I, Y), C > Y.

% each student can only select one school.
:- C = #count { I : match(I, A) }, student(A), C > 1.

% proceed justified envy freeness
:-  match(I1, A1), match(I2, A2), schoolRank(I2, A1, Q), schoolRank(I2, A2, W), Q < W, studentRank(A1, I1, X), studentRank(A1, I2, Y), Y < X, I1 != I2, A1 != A2. 

% Not allowed student A1 is not match and student A2 is matched while school has more priority to match A1.
notMatch(A) :- C = #count { I : match(I, A) }, student(A), C = 0.
:- notMatch(A1), match(I, A2), schoolRank(I, A1, Q), schoolRank(I, A2, W), Q < W.

% Not allowed school still has positions and student has preference of that school but student is still not matched.
:- notMatch(A1), C = #count { A : match(I, A) }, school(I), quota(I, Y), C < Y, studentRank(A1, I, X).

#show match/2.












