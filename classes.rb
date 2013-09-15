class Dessert
    def initialize(name, calories)
        @name = name
        @calories = calories
    end

    def name(name)
    	@name = name
    end

    def calories(calories)
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

mint = Dessert.new("mint", 30)
puts mint.name
puts mint.calories
puts mint.healthy?
puts mint.delicious?

fudge = Dessert.new("fudge", 420)
puts fudge.name
puts fudge.calories
puts fudge.healthy?
puts fudge.delicious?

class JellyBean < Dessert
	def initialize(name, calories, flavor)
		super(name, calories)
		@flavor = flavor
	end

	def delicious?
		return super unless @flavor == "black licorice"
		false
	end
end

blueberry_jb = JellyBean.new("jellybean", 36, "blueberry")
puts blueberry_jb.name
puts blueberry_jb.calories
puts blueberry_jb.healthy?
puts blueberry_jb.delicious?

black_licorice_jb = JellyBean.new("jellybean", 23, "black licorice")
puts black_licorice_jb.name
puts black_licorice_jb.calories
puts black_licorice_jb.healthy?
puts black_licorice_jb.delicious?