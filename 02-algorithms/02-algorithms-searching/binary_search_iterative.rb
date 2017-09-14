# assume items is a sorted array of objects (strings or integers or reals or anything that can be compared by <)
# assume item is an item of the same type as those in items
# bin_search_iterative(items, item) will then return either the index where item
# can be found in the array, or nil if it is not in the array
def bin_search_iterative(items, item)
    low = 0
    high = items.length - 1
    while low <= high do
        mid = (low+high)/2
        value = items[mid]

        if value < item
            low = mid+1
        elsif value > item 
            high = mid - 1
        else
            return mid
        end
    end
    return nil
end