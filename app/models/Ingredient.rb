class Ingredient

    attr_accessor :name
    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.most_commo_allergen
        Allergy.all.max_by{|allergy_instance| Allergy.all.count(allergy_instance.ingredient)}.ingredient
    end

end
