 # This method takes n arrays as input and combine them in sorted ascending  order
def combine_and_sort(*arrays)
    tree = Hash.new()
    arrays.each do |array|
        array.each do |value|
            insert(value, tree)
        end
    end
    sort_tree(tree)
end

# inserts a value into a binary tree
# if the tree is empty, insert into the root position
# if the value is less than or equal to the root,
# insert into the left position
# if the value is greater than the root, insert into
# the right position
def insert(value, tree)
    if tree[:root] == nil
        tree[:root] = value
        return
    end
    if tree[:root] >= value
        insert_left(value, tree)
        return
    end
    insert_right(value, tree)
end

# insert value into left branch of tree
# if there is no left branch, create
# new Hash, and let this value be the root
# otherwise, insert into the left branch
def insert_left(value, tree)
    left = tree[:left]
    if left == nil
        left = Hash.new()
        left[:parent] = tree
        tree[:left] = left
    end
    insert(value, left)
end

# insert value into right branch of tree
# if there is no right branch, create
# new Hash, and let this value be the root
# otherwise, insert into the right branch
def insert_right(value, tree)
    right = tree[:right]
    if right == nil
        right = Hash.new()
        right[:parent] = tree
        tree[:right] = right
    end
    insert(value, right)
end

# To sort the binary tree, just
# sort the left branch, then add the root node, then sort the right branch
def sort_tree(tree)
    root = tree && tree[:root]
    if root == nil
        return []
    end
    arr1 = sort_tree(tree[:left])
    arr2 = sort_tree(tree[:right])
    return arr1 + [root] + arr2
end

arr1 = [3, 1, 4]
arr2 = [1, 5, 9]
arr3 = [2, 6, 5]

arr = combine_and_sort(arr1, arr2, arr3)
puts(arr.to_s)