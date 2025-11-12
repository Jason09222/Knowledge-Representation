## Please Refer to [assignment2.pdf](https://github.com/user-attachments/files/23491447/assignment2.pdf)

## Requirements
### Multiagent Resource Allocation

[1.1] Consider a resource allocation setting in which n agents have positive additive utilities over m > n indivisible items. Prove or disprove the following statements.

[1.1.1] The allocation that maximises utilitarian welfare is Pareto-optimal.
[1.1.2] If an allocation is Pareto-optimal, it is envy-free.
[1.1.3] If n = 2, envy-freeness and proportionality are equivalent.
[1.1.4] The sequential allocation algorithm, in which agents arrive in order (1, 2, 3, ... , n) and are given a most preferred unallocated item, is strategyproof.

[1.2] Consider the following school choice problem with five students 1, 2, 3, 4, 5 and five schools a, b, c, d, and e with each school having exactly one seat. The preferences of the students are as follows from left to right in decreasing order of preference:

1 e b a c d
2 b a c d e
3 a b c d e
4 a b c d e
5 d b c a e

The priorities of the schools are as follows from left to right in decreasing order of preference:

a 2 4 3 5 1
b 3 2 4 5 1
c 3 2 4 5 1
d 5 2 4 3 1
e 1 2 3 4 5

[1.2.1] Find the outcome matching of the student proposing deferred acceptance algorithm, showing working out. Prove or disprove that the resultant matching is Pareto-optimal for the students.
[1.2.2] Suppose that initially, student 1 is allocated to school a, student 2 is allocated to school b, student 3 is allocated to school c, student 4 is allocated to school d, and student 5 is allocated to school e. Apply the Top Trading Cycles (TTC) Algorithm with respect to the students’ preferences here and find the output, showing working out.
[1.2.3] Give three reasons, with examples if necessary, to explain why the deferred acceptance algorithm is preferred for school choice over the TTC algorithm.
[1.2.4] Give a reason, using an example if necessary, to explain why TTC may be preferred for this school choice setting over the deferred acceptance algorithm.

Social Choice Theory

[2.1] Consider the following preference profile of voters.

1 c ≻ d ≻ b ≻ a
2 d ≻ c ≻ b ≻ a
3 a ≻ d ≻ c ≻ b

[2.1.1] Prove or disprove that the preference profile is single-peaked with respect to some order of alternatives.
[2.1.2] Prove or disprove that a Condorcet winner exists for the preference profile.
[2.1.3] Compute the pairwise majority graph for the preference profile.
[2.1.4] Compute the Top Cycle set for the preference profile.

[2.2] Let A be a set of alternatives with |A| ≥ 3, and let f : L(A)^n → A be a social choice function.

[2.2.1] Show that if f is strategyproof and surjective (onto), then f is Pareto-optimal and monotonic.
[2.2.2] Hence, prove that f is a dictatorship (i.e. f does not satisfy the non-dictatorial rule).
Note. You may not use the Gibbard-Satterthwaite theorem.

[2.3] Let f : L(A)^n → L(A) be a social welfare function. A function f is said to be unanimous with respect to ⪯ if for each x, y ∈ A and each i ∈ N, x ⪯i y implies x ⪯ y. In other words, if y is favoured in every voting profile, then y is the unanimous alternative.

Prove that if f satisfies the unanimous property and the independence of irrelevant alternatives axiom, then f is a dictatorship.
