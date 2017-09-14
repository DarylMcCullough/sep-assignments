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


### 5. Create a graph using the data below. Here's a CSV with the values you'll need.
### What's the asymptotic limit as n approaches infinity for the function defined by the values above?
    What is the Big-O of an algorithm that has the data points above?
    Write a Ruby script that calculates and prints the N number, given an iteration, for linear search in the worst case (similar to the graph above).
    Create a graph from the output using Google Sheets or other graphing software. Analyze the graph and denote its Big-O somewhere on the graph.
    What is the Big-O of binary search?
    What is the Big-Ω of binary search?
    What is the Big-Ө of binary search?
