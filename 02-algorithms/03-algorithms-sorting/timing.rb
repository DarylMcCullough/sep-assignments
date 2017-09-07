require 'benchmark'
require_relative 'bucket_sort'
require_relative 'quicksort'
require_relative 'heapsort'

Benchmark.bm(7, "task", "user", "system", "total", "real") do |x|
    x.report("bucket_sort") do
        bucketsort(words, 10)
    end
    
    x.report("quicksort") do
        quicksort(words)
    end
    
    x.report("heapsort") do
        heapsort(words)
    end
end

# RESULTS
#                   user     system      total        real
# bucket_sort   0.000000   0.000000   0.000000 (  0.000538)
# quicksort     0.000000   0.000000   0.000000 (  0.000090)
# heapsort      0.000000   0.000000   0.000000 (  0.000221)