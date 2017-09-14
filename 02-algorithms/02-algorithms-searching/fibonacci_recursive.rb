 def fib_rec(n)
   if (n == 0)
     # #1
     return 0
   elsif (n == 1)
     # #2
     return 1
   else
     # #3
     return fib_rec(n-1) + fib_rec(n-2)
   end
 end