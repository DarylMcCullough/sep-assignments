# Big-O for three algorithms

I implemented 4 algorithms with the same behavior:
1. Take a number of arrays as inputs
2. Return a combine array that is sorted. 

The implementations are:
## `02-algorithms/06-improving-complexity/poorly_written_ruby.rb`: **poorly_written_ruby(\*arrays)**
This algorithm is `O(n^2)`, because it must loop through all unsorted elements, and then loop through the sorted elements
to find the spot to insert the next unsorted element.

## `02-algorithms/06-improving-complexity/improving_complexity_version_one.rb`: **better_written_ruby(\*arrays)**
This algorithm uses the same strategy as the above one, except that it eliminates an initial loop through all
elements (to create the combined array). There is still a nested loop that makes the complexity `O(n^2)`

## `02-algorithms/06-improving-complexity/improving_complexity_version_two.rb`: **combine_and_sort(\*arrays)**
This algorithm first puts all the elements into a binary tree. For the average case (where the tree is
roughly balanced), the complexity will be `O(n log_2(n)`, because creating the tree involves

1. Iterating over all elements.
2. Navigating the tree to find the correct place to place the new element.

The first step is proportional to the number of elements, while the second step is proportional to the depth of the tree.
The first step is complexity `n`. In the case of a balanced tree, the second step is proportional to `log_2(n)`. In the worst case of a completely unbalanced
tree, the depth of some branches might be proportional to `n` as well.

So in the worst case, the complexity is `O(n^2)` as well, but does much better in typical cases.

With a little tweak, the worst case can be made `O(n log_n(2))`, if at each insertion to create the tree, we rearrange to make a balanced
tree.

## `02-algorithms/06-improving-complexity/improving_complexity_version_three.rb`: **combine_and_sort(\*arrays)**

This algorithm has the same worst-case complexity `O(n^2)` and typical case complexity `O(n log_2(n))` as the previous algorithm. One
difference is that this algorithm sorts the array in place, without the need to create any additional temporary data structures. So the
space required is a little better.
 
