# Writing assembly programs with the MIPS instruction set

Write an assembly program in MIPS that for a given two vectors, as arrays of integers, will calculate their sum and their scalar product. 

Example:
𝑣1 = (1; 3; −7)
𝑣2 = (4; −2; −1) <br>
sum of vectors → 𝑣1 + 𝑣2 = [1 + 4; 3 + (−2); (−7) + (−1)] = (5; 1; −8) <br>
scalar product → 𝑣1 ∗ 𝑣2 = 1 ∗ 4 + 3 ∗ (−2) + (−7) ∗ (−1) = 4 - 6 + 7 = 5

Example (for index number 123456): <br>
Input: 268501280 3 1 3 -7 4 -2 -1

| memory address for storing the vector of the sum   |      Size of vectors     |  vector 1    | vector 2   | 
|----------|:-------------:|------:|------:|
| 268501280 |  3 | - 1, 3, -7 | 4, -2, -1|
