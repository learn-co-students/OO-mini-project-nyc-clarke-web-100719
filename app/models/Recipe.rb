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
    
#############################JOIN-MODELS################################################################################################################################################

    def recipe_cards #For a given recipe instance, returns all RecipeCard instances
        RecipeCard.all.select {|recipe_card_instance| recipe_card_instance.recipe == self}
    end

    def recipe_ingredients #For a given recipe instance, returns all RecipeIngredient instances
        RecipeIngredient.all.select {|recipe_ingredient_instance| recipe_ingredient_instance.recipe == self}
    end
    
##############################MANY-TO-MANY#############################################################################################################################################
    
    def users #return the user instances who have recipe cards with this recipe
        recipe_cards.map {|recipe_card_instance| recipe_card_instance.user} 
        #run #recipe_cards method and return an array of each user who has a recipe card for this recipe
    end   

    def ingredients #return all of the ingredients in this recipe
        recipe_ingredients.map {|recipe_ingredient_instance| recipe_ingredient_instance.ingredient}
    end

###################################################################################################################################

    def self.most_popular #returns recipe instance with the highest number of users (the recipe that has the most recipe cards)
       all.max_by {|recipe_instance| recipe_instance.recipe_cards.count} #iterate through all Recipes, run the #recipe_card method on each recipe & get the count of each recipe's recipe_cards, return the highest count
    end

    def allergens #return all of the `Ingredient`s in this recipe that are allergens for `User`s in our system.
        ingredients.select {|ingredient_instance| Allergy.find_allergen(ingredient_instance)}
    end
    
    def recipe_card_ratings
        recipe_cards.map {|recipe_card_instance| recipe_card_instance.rating}
    end

    def average_rating
        recipe_card_ratings.reduce(:+) / recipe_card_ratings.length.to_f
    end

    def add_ingredients(ingredients) #take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
        ingredients.each {|ingredient_instance| RecipeIngredient.new(ingredient_instance, self)}
    end

#     def self.check_no_ingredients(ingredient_list)
#         all.select do |recipe_instance| 
#             recipe_instance.ingredients do |recipe|
                
#             end
#             recipe_instance.ingredients.include?(ingredient)
#         end
#     end
# end 

    #  def self.check_ingredients(ingredient)
    #      all.select {|recipe_instance| recipe_instance.ingredients.include?(ingredient)}
    #  end

    def self.without_ingredients(ingredients_list)
        all.select do |recipe| #iterating through all recipes, check to see if each recipe’s ingredients are included in ingredients list. if false, select to make new array
            !recipe.ingredients.any? { |ingredient| ingredients_list.include?(ingredient) }
        end
    end
end