class User
    attr_accessor :name 

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def recipe_cards
        RecipeCard.all.select {|recipe_card_instance| recipe_card_instance.user == self}
    end

    def recipes
        recipe_cards.map {|recipe_card_instance| recipe_card_instance.recipe}.uniq
    end

    def add_recipe_card(recipe_instance, date, rating)
        RecipeCard.new(self, recipe_instance, date, rating)
    end

    def declare_allergy(ingredient_instance, intensity = 5)
        existing_allergy = Allergy.find_allergy_by_user_and_ingredient(self, ingredient_instance) 
        if existing_allergy
            existing_allergy.intensity = intensity
            existing_allergy
        else 
            Allergy.new(self, ingredient_instance, intensity)
        end
    end

    def allergies
        Allergy.all.select {|allergy_instance| allergy_instance.user == self}
    end

    def allergens
        allergies.map {|allergy_instance| allergy_instance.ingredient}
    end

    def top_three_recipes #top three average recipes by ratings (.average_rating was defined in Recipe class)
         recipes.max_by(3) {|recipe_instance| recipe_instance.average_rating}
    end

    def most_recent_recipe #return most recent unique recipe (.uniq is in #recipes method)
        recipes.last
    end

    #  def safe_recipes 
    #      unsafe_recipes = allergens.map {|allergen_instance| Recipe.check_ingredients(allergen_instance)}.flatten
    #      Recipe.all - unsafe_recipes
    #  end

    def safe_recipes
        Recipe.without_ingredients(allergens)
    end

end