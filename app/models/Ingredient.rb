class Ingredient
    attr_reader :ingredient_name
    @@all = []

    def initialize(ingredient_name)
        @ingredient_name = ingredient_name
        @@all << self
    end

    def self.all
        @@all
    end

end



