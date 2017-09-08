# DEF FIB(n)
#  SET fib_0 to 0
#  SET fib_1 to 1
#  FOR each value from 0 to one less than n
#    SET temp to fib_0
#    ASSIGN fib_1 to fib_0
#    COMPUTE temp + fib_1, ASSIGN to fib_1
#  END FOR
#  RETURN fib_1
#END DEF

def fib(n)
    fib_0 = 0
    fib_1 = 1
    (0...n).each do 
        temp = fib_0
        fib_0 = fib_1
        fib_1 = temp + fib_1
    end
    return fib_1
end