class Graph
    
    def initialize()
        @cities = []
        @distances = []
    end
    
    def set_distances(triples)
        triples.each do |triple|
            set_distance(triple[0], triple[1], triple[2])
    
    def add_city(city_name)
        index = @cities.length
        @cities.push(city_name)
        @distances.push(Hash.new)
        return index
    end

    def set_distance(city1, city2, distance)
        i = @cities.index(city1) || add_city(city1)
        j = @cities.index(city2) || add_city(city2)
        hash1 = @distances[i]
        hash2 = @distances[j]
        hash1[j] = distance 
        hash2[i] = distance
    end
    
    def compute_shortest_path(index1, path)
        dist = Hash.new 
        current_index = index1
        dist[index1] = 0
        visited = []

        while true  do
            d0 = dist[current_index]
            neighbors = @distances[current_index]
            next_index = nil
            neighbors.each_key do |key|
                if visited.include?(key)
                    next 
                end
                d = neighbors[key]
                new_dist = d + d0
                if dist[key] == nil || new_dist < dist[key]
                    dist[key] = new_dist
                end
                if next_index == nil | new_dist < dist[next_index]
                    next_index = key
                end
            end
            
            if next_index == nil
                return nil
            end
            if ! path.include?(current_index)
                break
            end
            visited.push(current_index)
            current_index = next_index
        end
        path1 = []
        while (current_index != index1) do
            path1.unshift(current_index)
            neighbors = @distances[current_index]
            next_index = nil
            neighbors.each_key do |key|
                if dist[key] && dist[key] < dist[current_index]
                    if next_index == nil || dist[key] < dist[next_index]
                        next_index = key
                    end 
                end
            end
            current_index = next_index
        end
        path.concat(path1)
        return current_index
    end

    def tsp_greedy()
        current_index = 0
        path = [current_index]
        until current_index == nil do 
            current_index = compute_shortest_path(current_index, path)
        end
        return path
    end
end


