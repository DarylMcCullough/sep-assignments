require 'benchmark'
require_relative 'fibonacci_recursive'
require_relative '../01-intro/fibonacci_iterative'

Benchmark.bm(7, "task", "user", "system", "total", "real") do |x|
    x.report("recursive fib_rec(20)") do
        fib_rec(20)
    end
    
    x.report("iterative fib(20)") do
        fib(2)
    end
end

# RESULTS    
#                               user     system      total        real
# recursive fib_rec(20)     0.010000   0.000000   0.010000 (  0.001366)
# iterative fib(20)         0.000000   0.000000   0.000000 (  0.000005)
