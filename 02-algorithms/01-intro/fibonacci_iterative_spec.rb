include RSpec

require_relative 'fibonacci_iterative'

RSpec.describe "fib" do
    describe "fib of 0" do
        it "returns 1" do 
            expect(fib(0)).to eq(1)
        end
    end 
    
    describe "fib of 1" do 
        it "returns 1" do 
            expect(fib(1)).to eq(1)
        end
    end 
    
    describe "fib of 4" do
        it "returns fib(2) + fib(3)" do
            expect(fib(2) + fib(3)).to eq(fib(4))
        end
    end
end