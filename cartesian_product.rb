class Array
	def *(a)
		CartesianProduct.new(self, a)
	end
end	

class CartesianProduct
	include Enumerable
    
    def initialize(a, b)
    	@product = []
    	
    	a.each do |a|
    		b.each do |b|
    			@product << [a, b]
    		end
    	end
    end

    def each
    	@product.each do |element|
    		yield element
    	end
    end
end

c = CartesianProduct.new([:a, :b], [4, 5])
c.each {|elt| puts elt.inspect}
puts

([:a, :b, :c] * [4, 5, 6, 7]).each {|elt| puts elt.inspect}