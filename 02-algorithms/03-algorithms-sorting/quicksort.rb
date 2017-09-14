def quicksort(items)
    quicksort_aux(items, 0, items.length)
    return items
end 


# This is a challenge to myself. Rather than create a bunch of arrays,
# This will sort the items in place, for all items with index i where
# start_index <= i < end_index
def quicksort_aux(items, start_index, end_index)
    if end_index - start_index < 2
        return
    end

    k = partition(items, start_index, end_index)
    quicksort_aux(items, start_index, k)
    quicksort_aux(items, k+1, end_index)
    return
end

# This method rearranges the elements of items so that that for every i,
# if start_index <= i <= k, then items[i] <= items[k]
# if k < i < end_index, then items[i] > items[k]
def partition(items, start_index, end_index)
    pivot = items[start_index]
    
    # We're going to maintain the following condition:
    # If start_index < i <= k_min, then items[i] <= pivot
    # If k_max <= i < end_index, then items[i] > pivot
    # When k_max-1 == k_min, then we put the pivot into
    # position k_min, and return k_min
    k_min = start_index
    k_max = end_index
    while k_min+1 < k_max do
        # increment k_min as far as you can
        while items[k_min+1] <= pivot do
            k_min = k_min + 1
            if k_min+1 == k_max
                break
            end
        end
    
        # decrement k_max as far as you can
        while items[k_max-1] > pivot do 
            k_max = k_max - 1
            if k_max - 1 == k_min
                break
            end
        end
        
        if k_max - 1 == k_min
            break
        end 
        
        # at this point, we know that items[k_min+1] > pivot > items[k_max-1]
        # so swap them
        
        tmp = items[k_min+1]
        items[k_min+1] = items[k_max-1]
        items[k_max-1] = tmp
        k_min = k_min + 1
        k_max = k_max - 1
    end
    
    # at this point, we know that start_index ... k_min is less than or equal to pivot
    # k_min+1 ... end_index is greater than pivot
    # So swap pivot into position k_min and return k_min
    
    items[start_index] = items[k_min]
    items[k_min] = pivot
    return k_min
end
