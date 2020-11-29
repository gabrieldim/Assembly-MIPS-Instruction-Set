# Writing assembly programs with the MIPS instruction set

Write an assembly program in MIPS that for a given two vectors, as arrays of integers, will calculate their sum and their scalar product. The sum of two vectors is a vector whose elements at a given position are the sum of the elements of the two vectors at the same positions. A scalar product of two vectors is a scalar that is obtained as the sum of the products of the separate elements of the two vectors.

Example:
𝑣1 = (1; 3; −7)
𝑣2 = (4; −2; −1) <br>
sum of vectors → 𝑣1 + 𝑣2 = [1 + 4; 3 + (−2); (−7) + (−1)] = (5; 1; −8) <br>
scalar product → 𝑣1 ∗ 𝑣2 = 1 ∗ 4 + 3 ∗ (−2) + (−7) ∗ (−1) = 4 - 6 + 7 = 5


Vectors (arrays) are read from standard input. At the standard input, first the initial memory address for storing the sum is given, then the size of the vectors follows (both vectors have the same size), then the two vectors are given, ie their elements are read. Input sequences consist of a maximum of 20 integers. Strings should be stored in memory for which it is necessary to reserve a space of 20 words for both strings (help: with the command .space n allocate n consecutive bytes in memory).


The program should use a procedure to calculate a scalar product and a set of vectors. The procedure calculates the scalar product and the sum of the vectors, so that the sum of the vectors is directly stored in the memory of the expected address.

The standard output program should print the scalar product. The sum of the two vectors should remain written as an array of memory locations assigned to a standard input. Additionally, in register $ s1 save the value of the last 16 bits of your index value (use a value calculation mask). You enter the index number through the data segment in the program and calculate the last 16 bits in the code.

<br>

Example (for index number 123456): <br>
Input: 268501280 3 1 3 -7 4 -2 -1

<br>

| memory address for storing the vector of the sum   |      Size of vectors     |  vector 1    | vector 2   | 
|----------|:-------------:|------:|------:|
| 268501280 |  3 | - 1, 3, -7 | 4, -2, -1|


<br>

Exit: <br>
5 <br>
Additionally, the sum vector (5, 1, -8) is stored in memory starting at memory location 268501280, and the value in register $ s1 is 57920 (value of the last 16 bits of 123456).