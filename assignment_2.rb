# Part 1
class Dessert
    def initialize(name, calories)
        self.name = name
        self.calories = calories
    end

    def name=(name)
    	@name = name
    end

    def calories=(calories)
    	@calories = calories
    end

    def name
    	@name
    end

    def calories
    	@calories
    end

    def healthy?
        @calories < 200
    end

    def delicious?
        true
    end
end

def test_dessert(dessert)
	puts "Name: " + dessert.name
	puts "Calories: " + dessert.calories.to_s
	puts "Healthy?: " + dessert.healthy?.to_s
	puts "Delicious?: " + dessert.delicious?.to_s
	puts
end

mint = Dessert.new("mint", 30)
test_dessert(mint)

fudge = Dessert.new("fudge", 420)
test_dessert(fudge)

class JellyBean < Dessert
	def initialize(name, calories, flavor)
		super(name, calories)
		self.flavor = flavor
	end

	def flavor=(flavor)
		@flavor = flavor
	end

	def flavor
		@flavor
	end

	def delicious?
		return super unless @flavor == "black licorice"
		false
	end
end

blueberry_jb = JellyBean.new("blueberry jellybean", 36, "blueberry")
test_dessert(blueberry_jb)

black_licorice_jb = JellyBean.new("black licorice jellybean", 23, "black licorice")
test_dessert(black_licorice_jb)

# Part 2
class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s       # make sure it's a string
        attr_reader attr_name            # create the attribute's getter
        attr_reader attr_name+"_history" # create bar_history getter
        class_eval %Q"
            def #{attr_name}= (val)
                if @#{attr_name}_history.nil?
                    @#{attr_name}_history = [nil]
                end
                @#{attr_name}_history << val
                @#{attr_name} = val
            end
        "
    end
end

class Foo
    attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 1
puts f.bar
f.bar = 2
puts f.bar
print f.bar_history
puts

# Part 3
# Part a)
class NoSuchCurrencyError < StandardError ; end

class Numeric
    @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
    def in(currency)
        singular_currency = currency.to_s.gsub( /s$/, '')

        raise NoSuchCurrencyError unless @@currencies.has_key?(singular_currency)
        
        self * @@currencies[singular_currency]
    end

    def method_missing(method_id)
        singular_currency = method_id.to_s.gsub( /s$/, '')
        if @@currencies.has_key?(singular_currency)
            self * @@currencies[singular_currency]
        else
            super
        end
    end
end

puts 12.yen
puts 12.dollars
puts 10.euros
puts

puts 1.dollars.in(:dollars)
puts 1.yen.in(:dollars)
# puts 1.yen.in(:japan)
puts

# Part b)
class String
    def palindrome?
        string = self[/[a-zA-Z]/].downcase

        string == string.reverse
    end
end

def palintest(number, string)
    if string.palindrome?
        print("PalinTest#{number}: Success\n")
    else
        print("PalinTest#{number}: Failed\n")
    end
end

palintest(1, "Abracadabra")
palintest(2, "Madam, I'm Adam!")
palintest(3, "A man, a plan, a canal -- Panama")

# Part 4
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