 # This method takes n arrays as input and combine them in sorted ascending  order
 # Note: the previous version looped over the elements in the arrays twice:
 # once to create the combined array, and then to put the combined array elements
 # into the sorted array. This version skips creating a combined array, and
 # just directly puts the elements into the sorted array.
 def better_written_ruby(*arrays)
   sorted_array = []
   num_sorted = 0
   arrays.each do |array|
    array.each do |value|
     (0..num_sorted).each do |i|
      if i == num_sorted || value <= sorted_array[i]
       sorted_array.insert(i, value)
       break
      end
     end
     num_sorted += 1
    end
   end

   # Return the sorted array
   sorted_array
 end