class Dessert
    def initialize(name, calories)
        @name = name
        @calories = calories
    end

    def healthy?
        @calories < 200
    end

    def delicious?
        true
    end
end

jellybean = Dessert.new("jellybean", 30)
puts jellybean.healthy?
puts jellybean.delicious?

fudge = Dessert.new("fudge", 420)
puts fudge.healthy?
puts fudge.delicious?