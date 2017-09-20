### 1. Describe an analogy for relating an algorithm that has efficiency O(1) and another algorithm that has O(2n).

For an algorithm that computes an answer to a question, `O(1)` is like reaching into your pocket and pulling out the answer.
`O(2^n)` is like when the answer is a needle and your searching for it in a haystack.

### 2. In plain English, what is the best case scenario for binary search?

In a binary search, we have a set of values which are arranged
in order. When asked whether a given value is in the set, what we
do is:

1. Pick the middle value.
2. Check if it's equal, greater than or less than the given value.
3. If it's equal, we're done.
4. If it's less than or greater than, then we consider the subset of values greater than the given value and less than the given value.
5. We continue dividing the ranges in half until we find the value (or until the range is 1, so we know the given value is not there)

So in the best case scenario, the given value is equal to the middle value. So it
takes constant time.

### 3. In plain English, what is the worst-case scenario for binary search?

Since our algorithm proceeds by dividing the range in half each time,
the worst case is when you have to go all the way to ranges of
size 1. The number of iterations would be equal to the depth of the binary
tree of all the values (where each node is the middle value).
We can work out what the maximum depth is: If we have three
elements, the maximum depth is 2. If we have 7 elements, the
maximum depth is 3. In general, if we have `2^n - 1` elements,
then the maximum depth is n.

### 4. In plain English, what is the bounded-case scenario for binary search?

The worst case for binary search is `log_2(n)`. The best case is constant time (if the first item that you look at from the collection is the item you're
looking for, then the search returns immediately). A function that is always between the worst case and best case is `log_2(n)/2`. But since multiplicative
constants such as `1/2` are ignored in talking about complexity, we can say that the bounded case is the same as the worst case, `log_2(n)`.

### 5. Create a graph using the data below. Here's a CSV with the values you'll need.

The graph is plotted in the file `/02-algorithms/04-complexity-intro/loglinear_intro.pdf`

### 6. What's the asymptotic limit as n approaches infinity for the function defined by the values above?

The complexity is `O(2^n)`, which means that it grows without bound as `n --> infinity`. So it doesn't
have any asymptotic limit. An asymptote to a function is a straight-line that the function approaches.
For example, the function `1/x` approaches the straight line `g(x) = 0`. But for the function `2^n`, there
is no asymptote as `n --> infinity`. (The function `2^n` has the asymptote `g(n) = 0` for `n --> - infinity`, but
that's not meaningful, since `n` has to be nonnegative.)

### 7. What is the Big-O of an algorithm that has the data points above?

If the graph is the number of steps required to get an output, as a function of the problem size, `n`,
then the complexity is `O(2^n)`.

### 8. Write a Ruby script that calculates and prints the N number, given an iteration, for linear search in the worst case (similar to the graph above).
This is in `02-algorithms/04-complexity-intro/linear_complexity.rb`. The output is in the file `02-algorithms/04-complexity-intro/linea_complexity.csv`

### 9. Create a graph from the output using Google Sheets or other graphing software. Analyze the graph and denote its Big-O somewhere on the graph.
The graph is plotted in the file `/02-algorithms/04-complexity-intro/linear_search_complexity.pdf`.

### 10. What is the Big-O of binary search?
`Big-O(log_2(n))`

### 11. What is the Big-Ω of binary search?

`Big-Omega(1)`

### 12. What is the Big-Ө of binary search?
`Big-Theta(log_2(n))`
