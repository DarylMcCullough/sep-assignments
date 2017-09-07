def heapsort(items)
    heapify(items)
    end_index = items.length
    start_index = end_index 
    # We're maintaining a heap from index 0 to index start_index-1
    # From index start_index to end_index, we have a sorted array
    # We constantly take the largest element from the heap, and put
    # it at the index start_index-1 and then decrement start_index
    # When start_index = 0, the entire list is sorted
    while start_index > 0 do
        remove_head(items, start_index - 1)
        start_index = start_index - 1
    end
    return items
end 

# This swaps the first item with the one at index last_index
# Then it percolates down to restore the heap property for
# the smaller heap at indices i with 0 <= i < last_index
def remove_head(items, last_index)
    if last_index == 0
        return
    end
    tmp = items[last_index]
    items[last_index] = items[0]
    items[0] = tmp
    percolate_down(items, 0, last_index)
end


# This figures out the largest child index of the node at index n
# If this child is larger than the node, then swap the parent and the child
# and continue percolating down.
def percolate_down(items, n, last_index) # if node number n has lower value than one of its children, move the node down.
    root = items[n] # node number n
    l = left_index(n, last_index)
    r = right_index(n, last_index)
    left = l && items[l]
    right = r && items[r]
    return unless left || right # if no children, we're done
    if left == nil || (right && left < right) # find whether left or right has the highest value
      node = right
      index = r
    else
      node = left
      index = l
    end
    
    # now, node is the highest-value child node, and index is its index
    
    if node > root # if the child has greater value, swap
      items[index] = root
      items[n] = node
      percolate_down(items, index, last_index) # if necessary, keep percolating downward.
    end
end

def parent_index(i) # if a node has index i, then its parent has index (i-1)/2 (rounded down)
    if i == 0
        return nil # the 0th node is the root, which has no parent
    end
    return (i-1)/2
end

def left_index(i, last_index) # if a node has index i, then its left child has index 2i+1
    n = 2*i + 1
    if n < last_index
      return n
    else
      return nil
    end
end
  
def right_index(i, last_index) # if a node has index i, then its right child has index 2i+2
    n = 2*i + 2
    if n < last_index
      return n
    else
      return nil
    end
end

# This creates a binary heap by putting the largest
# item into the first position, and making
# sure that each child node is smaller than its
# parent node.
# It starts with the one-item heap consisting of
# just the first element. Then it adds each
# succeeding node to the heap, and percolates
# up to put it into place.
def heapify(items)
    # maintain the condition that
    # for 0 <= i < end_index,
    # we have a heap
    end_index = 1
    while end_index < items.length do
        percolate_up(items, end_index)
        end_index = end_index + 1
    end
end

# This moves node n upward until it has a parent that is larger
# than it is.
def percolate_up(items, n) # if node number n has a greater value than its parent, move the node up
    if n == 0 # no parent, so done
      return
    end
    item = items[n] # get the node
    parent = items[parent_index(n)] # get the parent
    if parent < item # if the node's value is greater than the parent,
      items[n] = parent # switch places with the parent
      items[parent_index(n)] = item
      percolate_up(items, parent_index(n)) # possibly continue to percolate upward
    end
end
    