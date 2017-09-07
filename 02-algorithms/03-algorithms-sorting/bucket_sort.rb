def bucketsort(items, n)
    if items.length < 2
        return items
    end
    item = items.last
    same = true
    items.each do |item1|
        if item1.downcase != item.downcase
            same = false
            break 
        end
    end
    
    if same
        return items
    end
    
    buckets = get_empty_buckets(n)
    put_in_buckets(items, buckets)
    retval = []
    (0...buckets.length).each do |i|
        bucket = buckets[i]
        if i+1 == buckets.length || bucket.length < 2
            arr = bucketsort(bucket, n)
        else
            arr = bucket[0, bucket.length - 1]
            item = bucket.last
            arr = bucketsort(arr, n) + [item]
        end
        retval = retval + arr
    end
    return retval
end


def get_empty_buckets(n)
    buckets = []
    (0...n).each do
        buckets.push([])
    end 
    return buckets
end

def get_samples(items, n)
    samples = []
    items.each do |item|
        if samples.length >= n-1
            return samples
        end
        index = samples.length
        (0...samples.length).each do |i|
            sample = samples[i]
            if item && item.downcase < sample.downcase
                index = i 
                break
            end
            if item == nil || item.downcase == sample.downcase
                index = nil
                break
            end
        end 
        if index
            
            samples.insert(index, item.downcase)
        end 
    end 
    return samples
end

def put_in_buckets(items, buckets)
    samples = get_samples(items, buckets.length)

    items.each do |item|
        inserted = false
        (0...samples.length).each do |i|
            sample = samples[i]
            if item.downcase < sample.downcase
                buckets[i].insert(0, item)
                inserted = true
                break
            end
            if item.downcase == sample.downcase
                buckets[i].push(item)
                inserted = true
                break
            end
        end
        if ! inserted
            buckets[samples.length].insert(0, item)
        end
    end
    return buckets
end
    
def words
    return [
        "now",
        "is",
        "the",
        "time",
        "for",
        "all",
        "good",
        "men",
        "to",
        "come",
        "to",
        "the",
        "aid",
        "of",
        "their",
        "country",
        "all",
        "cows",
        "eat",
        "grass",
        "good",
        "boys",
        "do",
        "fine",
        "always",
        "every",
        "good",
        "boy",
        "does",
        "fine",
        "the",
        "quick",
        "brown",
        "fox",
        "jumped",
        "over",
        "the",
        "lazy",
        "dog",
        "once",
        "upon",
        "a",
        "midnight",
        "dreary",
        "as",
        "I",
        "pondered",
        "weak",
        "and",
        "weary"]
end