# Computes the worst case number of iterations required to search for a value 
# among a set of n values, using linear search

def linear_search_complexity(n, file=nil)
    if file
        file.puts("#{n},#{n}")
    else
        puts("worst case for #{n} elements: #{n}")
    end
        
end

fname = "linear_search_complexity.csv"

if File.exists?(fname)
    file = File.open(fname, "w")
    file.puts("")
    file.close()
end
file = File.open(fname, "a")
    
(0..10).each do |n|
    linear_search_complexity(n, file)
end

file.close()