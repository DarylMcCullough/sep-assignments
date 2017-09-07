# assume items is a sorted array of objects (strings or integers or reals or anything that can be compared by <)
# assume item is an item of the same type as those in items
# bin_search_iterative(items, item) will then return either the index where item
# can be found in the array, or nil if it is not in the array
def bin_search_recursive(items, item)
    return bin_search_aux(items, item, 0, items.length-1)
end

def bin_search_aux(items, item, min, max)
    if min > max
        return nil
    end
    mid = (min + max)/2
    value = items[mid]
    if value < item 
        return bin_search_aux(items, item, mid+1, max)
    elsif value > item
        return bin_search_aux(items, item, min, mid-1)
    else
        return mid
    end
end