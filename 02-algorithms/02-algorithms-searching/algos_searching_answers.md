## Q1: Given the alphabetically sorted collection in this checkpoint, how many iterations would it take to find the value G using linear search?

Using a linear search for "G" in the list `["A", "B", "C", "D", "E", "F", "G"]`, it will require 7 iterations, because it will go through "A", "B", etc. before getting to "G".

## Q2: Given the alphabetically sorted collection in this checkpoint, how many iterations would it take to find the value G using binary search?

1. Initially, the low pointer will point to "A", the mid pointer will point to "D", and the high pointer will point to "G". We compare the mid value.
2. Since "D" is smaller than "G", on the next step, low will point to "E", mid will point to "F", and high will point to "G". We compare the mid value.
3. Since "F" is smaller than "G", on the next step, low will point to "G", mid will point to "G", and high will point to "G" We compare the mid value.
4. Since "G" is what we're looking for, we are done.

So it takes 3 iterations to find "G"

## Q3: Calculate fib(10), fib(11), fib(12) by hand.

```
fib(0) = 1
fib(1) = 1
fib(2) = 1+1 = 2
fib(3) = 1+2 = 3
fib(5) = 2+3 = 5
fib(6) = 3+5 = 8
fib(7) = 5+8 = 13
fib(8) = 8 + 13 = 21
fib(9) = 13 + 21 = 34
fib(10) = 21 + 34 = 55
fib(11) = 34 + 55 = 89
fib(12) = 55 + 89 = 144
```


## Q4: Given an unsorted collection of a million items, which algorithm would you choose between linear search and binary search? Would you use an iterative or recursive solution? Explain your reasoning.

If the items are unsorted, then there is no point in using a binary search, because it only works when the items are ordered.

## Q5: Given a sorted collection of a million items, which algorithm would you choose between linear search and binary search? Would you use an iterative or recursive solution? Explain your reasoning.

If the items are ordered, then binary search is much preferrable, because it takes a logarithmic number of steps, rather than linear.
