class Recipe 

    attr_accessor :name 

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def recipe_cards #return an array of recipe cards that a recipe instance is associated with
        RecipeCard.all.select {|recipe_card_instance| recipe_card_instance.recipe == self}
    end
    
    def self.most_popular #iterate through all Recipes, run the #recipe_card method on each recipe & get the count of each recipe's recipe_cards, return the highest count
       all.max_by {|recipe_instance| recipe_instance.recipe_cards.count} 
    end

    def users #run #recipe_cards method and return an array of each user who has a recipe card for this recipe
        recipe_cards.map {|recipe_card_instance| recipe_card_instance.user} 
    end

    def recipe_ingredients 
        RecipeIngredient.all.select {|recipe_ingredient_instance| recipe_ingredient_instance.recipe == self}
    end

    def ingredients
        recipe_ingredients.map {|recipe_ingredient_instance| recipe_ingredient_instance.ingredient}
    end

    def allergens
        ingredients.select {|ingredient_instance| Allergy.find_allergen(ingredient_instance)}
    end
    
    def recipe_card_ratings
        recipe_cards.map {|recipe_card_instance| recipe_card_instance.rating}
    end

    def average_rating
        recipe_card_ratings.reduce(:+) / recipe_card_ratings.length.to_f
    end

    def add_ingredients(ingredients)
        ingredients.each {|ingredient_instance| RecipeIngredient.new(ingredient_instance, self)}
    end

    def self.without_ingredients(ingredients_list)
        all.select do |recipe| #iterating through all recipes, check to see if each recipe's ingredients are included in ingredients list. if false, select to make new array
            !recipe.ingredients.any? { |ingredient| ingredients_list.include?(ingredient) }
        end
    end

end