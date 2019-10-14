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

    def recipe_cards #return all RecipeCards that includes this recipe instance
        RecipeCard.all.select {|recipe_card_instance| recipe_card_instance.recipe == self}
    end
    
    def self.most_popular #iterate through all Recipes, run the #recipe_card method on each recipe instance and get the count of each recipe's recipe_cards, return the highest count
       all.max_by {|recipe_instance| recipe_instance.recipe_cards.count} 
    end

    def users #run #recipe_cards method and then return an array of each user who has a recipe card for this recipe
        recipe_cards.map {|recipe_card_instance| recipe_card_instance.user} 
    end

    def recipe_ingredients #return all Recipe Ingredient instances where Recipe is the instance this method is called on 
        RecipeIngredient.all.select {|recipe_ingredient_instance| recipe_ingredient_instance.recipe == self}
    end

    def ingredients #run #recipe_ingredient method and then return all of the ingredients in the recipe instance this method is called on 
        recipe_ingredients.map {|recipe_ingredient_instance| recipe_ingredient_instance.ingredient}
    end

    def allergens #return all ingredients in this recipe instance if it is an allergy for any user instance
        ingredients.select {|ingredient_instance| Allergy.find_allergen(ingredient_instance)}
    end
    
    def recipe_card_ratings #return all ratings for Recipe Instances that have this recipe
        recipe_cards.map {|recipe_card_instance| recipe_card_instance.rating}
    end

    def average_rating #run #recipe_card_ratings method on recipe, add up those ratings, divide by length of array and convert to float
        recipe_card_ratings.reduce(:+) / recipe_card_ratings.length.to_f
    end

    def add_ingredients(ingredients) #run #ingredients which is passed an array of ingredients, and then with each ingredient element create a new RecipeIngredient instance with that ingredient and this recipe
        ingredients.each {|ingredient_instance| RecipeIngredient.new(ingredient_instance, self)}
    end

    def self.check_ingredients(ingredient) #helper method for User.safe_recipes method > this method will return all Recipe instances that include a passed in ingredient argument (which can also be an array of ingredients)
        all.select {|recipe_instance| recipe_instance.ingredients.include?(ingredient)}
    end

    def self.without_ingredients(ingredients_list) #iterating through all recipes, check to see if each recipe’s ingredients are included in ingredients list > if false, select and add to new array which will be returned
        all.select do |recipe| 
            !recipe.ingredients.any? { |ingredient| ingredients_list.include?(ingredient) }
        end
    end

end 