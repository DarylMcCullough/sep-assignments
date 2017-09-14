include RSpec
require_relative 'heapsort'
require_relative 'quicksort'
require_relative 'bucket_sort'

RSpec.describe "Sorting" do
    let (:pi) { [3, 1, 4, 1, 5, 9, 2, 6, 5, 3] }
    
    let(:words) { [
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
        "weary"]}
    let(:sorted_words) {["a", "aid", "all", "all", "always", "and", 
        "as", "boy", "boys", "brown", "come", "country", "cows", "do", 
        "does", "dog", "dreary", "eat", "every", "fine", "fine", "for", 
        "fox", "good", "good", "good", "grass", "I", "is", "jumped", "lazy", 
        "men", "midnight", "now", "of", "once", "over", "pondered", 
        "quick", "the", "the", "the", "the", "their",
        "time", "to", "to", "upon", "weak", "weary"] }
    
    describe "quicksort" do
        it "sorts the digits of pi" do
            quicksort(pi)
            expect(pi[0]).to eq(1)
            expect(pi[1]).to eq(1)
            expect(pi[2]).to eq(2)
            expect(pi[3]).to eq(3)
            expect(pi[4]).to eq(3)
            expect(pi[5]).to eq(4)
            expect(pi[6]).to eq(5)
            expect(pi[7]).to eq(5)
            expect(pi[8]).to eq(6)
            expect(pi[9]).to eq(9)
        end
    end
    
    describe "heapsort" do
        it "sorts the digits of pi" do
            heapsort(pi)
            expect(pi[0]).to eq(1)
            expect(pi[1]).to eq(1)
            expect(pi[2]).to eq(2)
            expect(pi[3]).to eq(3)
            expect(pi[4]).to eq(3)
            expect(pi[5]).to eq(4)
            expect(pi[6]).to eq(5)
            expect(pi[7]).to eq(5)
            expect(pi[8]).to eq(6)
            expect(pi[9]).to eq(9)
        end
    end
    
    describe "bucketsort" do
        it "sorts a bunch of words" do 
            words1 = bucketsort(words, 10)
            expect(words1).to eq(sorted_words)
        end 
    end
            
end