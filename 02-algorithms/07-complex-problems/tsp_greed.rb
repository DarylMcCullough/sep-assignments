class Graph
    attr_accessor :cities # An array of names of cities
    attr_accessor :distances # an array of hashes. distances[n][m] returns
                             # the distance from city #n to city #m
                             
    def initialize() # initially, no cities
        @cities = []
        @distances = []
    end
    
    # each triple is in the form of [cityname, distance, cityname]
    def set_distances(triples)
        
        triples.each do |triple|
            set_distance(triple[0], triple[1], triple[2])
        end
    end
    
    # adds the given city name to the end of the cities array
    def add_city(city_name)
        index = @cities.length
        @cities.push(city_name)
        @distances.push(Hash.new)
        return index
    end

    # sets the distance between two cities
    def set_distance(city1, distance, city2)
        i = @cities.index(city1) || add_city(city1)
        j = @cities.index(city2) || add_city(city2)
        hash1 = @distances[i]
        hash2 = @distances[j]
        hash1[j] = distance 
        hash2[i] = distance
    end
    
    # This function uses Dijkstra's Algorithm to
    # find the shortest path from the city of index1
    # to any city that is not already on the path.
    # If it can't find a way, it returns nil.
    # If it finds a path, then it adds the
    # discovered path to the end of the path argument,
    # and returns the index of the new city (the last
    # city on the path.
    
    def compute_shortest_path(index1, path)
        dist = Hash.new 
        current_index = index1
        dist[index1] = 0
        visited = []
        touched = [index1]

        # keep going until current_index is nil,
        # which means that there are no more cities
        # to consider that aren't already visited
        # or on path.
        while current_index  do
            d0 = dist[current_index]
            neighbors = @distances[current_index]
            # We already have the distance from
            # index1 to current_index. So
            # we go through all the neighbors
            # of current_index to compute the
            # distances to them.
            neighbors.each_key do |key|
                # touched is the set of all
                # indices reachable from 
                # index1, which we compute
                # as we go.
                if !touched.include?(key)
                    touched.push(key)
                end
                # visited means that it and its
                # neighbors have already
                # had distances computed.
                if visited.include?(key)
                    next 
                end
                
                # the distance to the neighbor
                # with index 'key'
                d = neighbors[key]
                
                # the distance of key from index1
                # must be less than or equal to
                # the sum of the distance from
                # current_index to index1 
                # and the distance of key from current_index
                new_dist = d + d0
                if dist[key] == nil || new_dist < dist[key]
                    dist[key] = new_dist
                end
            end
            if ! path.include?(current_index) # current_index is something not already on the path
                break
            end
            # mark current_index as visited
            visited.push(current_index)
            
            # now the next index is the index
            # with the shortest distance to
            # index1 that hasn't already been visited
            current_index = nil
            touched.each do |key|
                if visited.include?(key)
                    next 
                end
                if current_index == nil || dist[key] < dist[current_index]
                    current_index = key
                end
            end
        end
        
        if !current_index # didn't find any reachable index not already on path
            return nil
        end
        
        # construct the path from index1 to current_index
        # backwards, starting at current_index and tracing
        # to indices with the smallest distance to index1.
        path1 = []
        while (current_index != index1) do
            path1.unshift(current_index) # this puts each index at the front
            neighbors = @distances[current_index]
            next_index = nil
            
            # find the index of the neighbor with smallest
            # distance to index1
            neighbors.each_key do |key|
                if dist[key] && dist[key] < dist[current_index]
                    if next_index == nil || dist[key] < dist[next_index]
                        next_index = key
                    end 
                end
            end
            current_index = next_index
        end
        # path is the path we've found so far,
        # and path1 is the continuation to a new index
        # that is not already on path.
        # path1 might include indices already on path,
        # because it might be necessary to backtrack to
        # get to a new index not already on the path.
        path.concat(path1)
        
        # the last index is the new index on the path
        return path.last
    end

    # returns an array of indices from the city of index 0
    # which visits every city index (if possible)
    def tsp_greedy()
        current_index = 0
        path = [current_index]
        until current_index == nil do
            # find the nearest city not already on the path
            current_index = compute_shortest_path(current_index, path)
        end
        # when current_index == nil, that means there are no
        # more reachable cities that aren't already on the path
        return path
    end
end

# given an array of triples of the form [city1, distance, city2],
# finds a path that connects all cities, and prints it out
def tsp_greedy(triples)
    graph = Graph.new()
    graph.set_distances(triples)
    path = graph.tsp_greedy()
    txt = ""
    lastIndex = nil
    path.each do |index|
        if txt == ""
            txt = graph.cities[index]
        else
            txt += "( #{graph.distances[lastIndex][index]} )==>#{graph.cities[index]}"
        end
        lastIndex = index
    end
    puts(txt)
end

# Test
triples = [
    ["cityA", 1, "cityB"],
    ["cityA", 2, "cityC"]
]

tsp_greedy(triples)
# Prints out: cityA( 1 )==>cityB( 1 )==>cityA( 2 )==>cityC
# The number in parentheses is the distance traveled between the cities
# to the left and right of the parentheses

triples = [
    ["cityA", 1, "cityB"],
    ["cityA", 2, "cityC"],
    ["cityC", 2, "cityB"],
    ["cityB", 1, "cityD"],
    ["cityD", 1, "cityE"],
    ["cityE", 4, "cityC"]
]

tsp_greedy(triples)


# Prints out: cityA( 1 )==>cityB( 1 )==>cityD( 1 )==>cityE( 4 )==>cityC

