class Ingredient

    attr_accessor :name 

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def allergies
        Allergy.all.select {|allergy_instance| allergy_instance.ingredient == self}
    end
    
    def self.most_common_allergen
        all.max_by {|ingredient_instance| ingredient_instance.allergies.count}
    end

end