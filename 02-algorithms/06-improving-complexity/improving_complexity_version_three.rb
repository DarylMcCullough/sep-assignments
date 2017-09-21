def combine_and_sort(*arrays)
    combined_array = []
    arrays.each do |array|
        array.each do |value|
            combined_array.push(value)
        end
    end
    
    quicksort(combined_array, 0, combined_array.length)
end

def quicksort(arr, start, finish)
    if start >= finish
        return arr
    end
    pivot_index = partition(arr, start, finish)
    quicksort(arr, start, pivot_index)
    quicksort(arr, pivot_index+1, finish)
    return arr
end

def partition(arr, start, finish)
    pivot = arr[start]
    left_index = start
    right_index = finish
    
    # we want to maintain the invariant that
    # 1. left_index < right_index
    # 2. for any index >= start and <= left_index,
    # arr[index] <= pivot
    # 3. For any index >= right_index and < finish
    # arr[index] > pivot
    
    while left_index + 1 < right_index do
        if arr[left_index+1] <= pivot
            left_index = left_index+1
            next
        end
        if arr[right_index-1] > pivot
            right_index = right_index - 1
            next
        end
        # at this point, arr[left_index+1] > pivot
        # arr[right_index-1] <= pivot
        tmp1 = arr[left_index+1]
        tmp2 = arr[right_index-1]
        arr[left_index+1] = tmp2
        arr[right_index-1] = tmp1
        left_index = left_index + 1
        right_index = right_index - 1
    end
    arr[start] = arr[left_index]
    arr[left_index] = pivot
    return left_index
end