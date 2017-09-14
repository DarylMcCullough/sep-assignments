### 1. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.

```
# goodbye_world.rb
def goodbye_world(n)
 puts "Goodbye World! #{n}"
end
```

This algorithm is `Big-O(1)`, because it takes a constant amount of time, no matter
what value of `n` is used.

### 2. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.

```
# find_largest.rb
def find_largest(collection)
 largest = collection[0]
 collection.length.times do |i|
   if collection[i] >= largest
     largest = collection[i]
   end
 end
 largest
end
```

This algorithm is `Big-O(n)`, because the program cycles through the main loop
one time for each value from `0` to `n`, where `n` is the size of the collection.

### 3. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.

```
# find_largest_2D_array.rb
def find_largest(collection)
 largest = collection[0][0]
 collection.length.times do |i|
   subcollection = collection[i]
   subcollection.length.times do |i|
     if subcollection[i] >= largest
       largest = subcollection[i]
     end
   end
 end
 largest
end

```

This algorithm is again `Big-O(n)`, where `n` is the number of elements in the 2-D
array. The reason is that as above, it must cycle through every element in the array.
(Note: if the array has dimensions `m x k`, then `n = m * k` is the total number of
elements in the array.)

### 4. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.

```
# numbers_recurive.rb
def numbers(n)
 if (n == 0)
   return 0
 elsif (n == 1)
   return 1
 else
   return numbers(n-1) + numbers(n-2)
 end
end
```

Let `N(n)` be the number of recursive calls needed to compute `numbers(n)`.
Since, for `n > 1`, we have

`numbers(n) = numbers(n-1) + numbers(n-2)`, then we know:

`N(n) = N(n-1) + N(n-2)`

Since `N(n-2) <= N(n-1)`, we can reason, for `n > 1`:

`N(n) <= 2 N(n-1)`

So an upper bound for `N(n)` can be achieved by the function

`g(n) = 2 g(n-1)`

which describes the function `2^n`. So we have:

`N(n) <= 2^n`

That means that this function is `Big-O(2^n)`

### 5. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.

```
# numbers_iterative.rb
def iterative(n)
 num1 = 0
 num2 = 1

 i = 0
 while i < n-1
   tmp = num1 + num2
   num1 = num2
   num2 = tmp
   i+=1
 end

 num2
end
```

This algorithm is linear, since it runs through the loop `n-2` times to compute `iterative(n)`. So it's `O(n)`.
It saves over the recursive version because in the recursive implementation, computing `numbers(n-1)` involves doing
all the same calculations as computing `numbers(n-2)`, plus one additional addition. So we end up computing the same
vaues over and over again.

### 6. What's the Big-O of the following algorithm? Submit your work and reasoning with your solution.

```
# sort.rb
def sort(collection, from=0, to=nil)
 if to == nil
   # Sort the whole collection, by default
   to = collection.count - 1
 end

 if from >= to
   # Done sorting
   return
 end

 # Take a pivot value, at the far left
 pivot = collection[from]

 # Min and Max pointers
 min = from
 max = to

 # Current free slot
 free = min

 while min < max
   if free == min # Evaluate collection[max]
     if collection[max] <= pivot # Smaller than pivot, must move
       collection[free] = collection[max]
       min += 1
       free = max
     else
       max -= 1
     end
   elsif free == max # Evaluate collection[min]
     if collection[min] >= pivot # Bigger than pivot, must move
       collection[free] = collection[min]
       max -= 1
       free = min
     else
       min += 1
     end
   else
     raise "Inconsistent state"
   end
 end

 collection[free] = pivot

 sort collection, from, free - 1
 sort collection, free + 1, to

 collection
end
```

Each time you get a pivot, you must go through `n` iterations in order to put
the elements smaller than the pivot on the left, and those larger than the pivot
on the right, where `n` is the number of elements to sort.

After you're done partitioning, you'll have some number `m` on the left of the pivot,
and some number, `n-m-1` on the right of the pivot. Then you have to sort the
left side and the right side.

In the best case, the number of elements you have to sort gets halved each time
(that is, `m = n-m-1` or `m = (n-1)/2`). But the number of sets that need to be 
sorted doubles each time. So roughly speaking, 

1. Round one, we partition n elements.
2. Round two, we partition 2 sets of approximately n/2 elements.
3. Round three, we partition 4 sets of approximately n/4 elements.
4. Etc.

So roughly speaking, each round takes approximately the same length of time, which
is linear in `n`. The number of rounds is `log_2(n)`, because you keep halving
the number until you get to a single element, which takes `log_2(n)` rounds of halving.
So in the best case, it takes roughly 'n log_2(n)' iterations to sort the list.

The worst case happens when the original list was already almost in the right order.
Consider sorting the array of numbers `[100, 1, 2, 3, ..., 98, 99]`. In the first
round, you pick 100 as the "pivot", and move everything smaller than 100 to the left.
But that hardly does anything. After one round, you have:

`[99, 1, 2, 3, 4, ... 98, 100]`

Now, on the next round, you have to partition the list `[99, 1, ... 98]`
On the next round, you have to partition the list `[98, 1, ..., 97]`
Etc.

Clearly in this case, it will take 100 "rounds" to sort the list. The first round
takes 100 iterations, the second takes 99, etc. So the total number of iterations is:
`100 + 99 + ... + 1 = 100*(101)/2`. Since we don't care about constant multipliers,
we can say that this algorithm in the worst case is `Big-O(n^2)`.