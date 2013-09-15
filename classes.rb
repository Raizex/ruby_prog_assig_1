class Dessert
    def initialize(name, calories)
        self.name=(name)
        self.calories=(calories)
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
		self.flavor=(flavor)
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