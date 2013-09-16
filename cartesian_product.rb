class CartesianProduct
	include Enumerable
	attr_accessor :a, :b, :product
    
    def initialize(a, b)
    	self.a = a
    	self.b = b
    	calculate_product
    end

    def calculate_product
    	self.product = []
    	a.each do |a|
    		b.each do |b|
    			self.product << [a, b]
    		end
    	end
    end

    def each
    	product.each do |product|
    		yield product
    	end
    end
end

c = CartesianProduct.new([:a, :b], [4, 5])
c.each {|elt| puts elt.inspect}