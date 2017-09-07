include RSpec

require_relative 'binary_search_recursive'
require_relative 'binary_search_iterative'

RSpec.describe "bin_search" do
      let (:arr) { ["aardvark", "barracuda", 
      "capybara", "dingo", "elephant", "fox", "gekko", 
      "hippopotamus", "ibex", "jackal", "kangaroo", 
      "lemur", "mongoose", "narwhal", "opposum", "peccary",
      "quail", "racoon", "snake", "tiger", "unix", 
      "vulture", "wolverine", "xylophone", "zebra" ] }
      
      describe "find ibex recursively" do
          it "has index 8" do
              index = bin_search_recursive(arr, "ibex")
              expect(index).to eq(8)
          end
      end
      
        describe "find narwhal iteratively" do
          it "has index 13" do
              index = bin_search_iterative(arr, "narwhal")
              expect(index).to eq(13)
          end
      end
      
end