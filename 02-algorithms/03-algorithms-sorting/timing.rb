require 'benchmark'
require_relative 'bucket_sort'
require_relative 'quicksort'
require_relative 'heapsort'
require_relative 'insertion_sort'
require_relative 'selection_sort'
require_relative 'bubble_sort'
require_relative 'merge_sort'
require_relative 'words'


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
    
    x.report("merge_sort") do
        merge_sort(words)
    end
    
    x.report("bubble_sort") do
        bubble_sort(words)
    end
    
    x.report("selection_sort") do
        selection_sort(words)
    end
    
    x.report("insertion_sort") do
        insertion_sort(words)
    end
end

# RESULTS
#                   user     system      total        real
# bucket_sort       0.000000   0.000000   0.000000 (  0.000619)
# quicksort         0.000000   0.000000   0.000000 (  0.000083)
# heapsort          0.000000   0.000000   0.000000 (  0.000217)
# merge_sort        0.000000   0.000000   0.000000 (  0.000360)
# bubble_sort       0.000000   0.000000   0.000000 (  0.000489)
# selection_sort    0.000000   0.000000   0.000000 (  0.000242)
# insertion_sort    0.000000   0.000000   0.000000 (  0.000102)


def n_dots(n) 
    retval = ""
    (0...n).each do 
        retval += "X"
    end
    return retval
end

def print_results()
    results = {"bucket sort": 619, "quick sort": 83, "heap sort": 217, "merge sort": 360, "bubble sort": 489, "selection sort": 242, "insertion sort": 102}
    puts("Time for sorting 50 words  (one 'X' per 1/100000 seconds) ")
    results.keys.each do |key|
        puts("#{key}: #{n_dots(results[key]/10)}")
    end
end

print_results()

# Time for sorting 50 words  (one 'X' per 1/100000 seconds) 
# bucket sort:      XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
# quick sort:       XXXXXXXX
# heap sort:        XXXXXXXXXXXXXXXXXXXXX
# merge sort:       XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
# bubble sort:      XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
# selection sort:   XXXXXXXXXXXXXXXXXXXXXXXX
# insertion sort:   XXXXXXXXXX
