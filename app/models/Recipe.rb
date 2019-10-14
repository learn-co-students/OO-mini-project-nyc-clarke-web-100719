# class Recipe
#     attr_reader :recipe_name
#     @@all = []


#     def initialize(recipe_name)
#         @recipe_name = recipe_name
#         @@all << self
#     end

#     def self.all
#         @@all
#     end

#     def recipes
#         RecipeCard.all.select { |recipecard| recipecard.recipe == self }
#     end

#     def users
#         recipes.map { |recipe| recipe.user }
#     end

#     def recipe_ingredients
#         RecipeIngredient.all.select { |recipe_ingredient| recipe_ingredient.recipe == self }
#     end

#     def ingredients
#         recipe_ingredients.map { |recipe_ingredient| recipe_ingredient.ingredients }.flatten
#     end

#     def self.most_popular #what if they're tied?
#         hash = Hash.new(0)
#         RecipeCard.all.each { |recipe_card| hash[recipe_card.recipe] += 1 }
#         hash.key(hash.values.max)
#     end

#     def allergens
#         allergens_arr = users.map { |user| user.allergens }.flatten
#         allergens_arr.select do |allergen|
#             if ingredients.include?(allergen)
#                 allergen
#             end
#         end
#         # hash = {}
#         # RecipeCard.all.each do |recipe_card|
#         #     users.each do |user|
#         #         if !hash[recipe_card.user]
#         #             hash[recipe_card.user] = user.allergens
#         #         end
#         #     end
#         # end
#         # hash.values
#     end

#     def add_ingredients(ingredient)
#         # ingredient.each do |ingre_each|
#         #     if !ingredient_array.include?(ingredient)
#         #         ingredient_array << ingre_each
#         ingredient.each do |ingre_each|
#             RecipeIngredient.new(ingre_each, self)
#         end  
#         # updated_ingredients = ingredients
#         # ingredient.each { |ingredient| updated_ingredients << ingredient }
#         # updated_ingredients
#     end

# end


class Recipe
    attr_reader :name

    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.most_popular #what if they're tied?
        hash = Hash.new(0)
        RecipeCard.all.each { |recipe_card| hash[recipe_card.recipe] += 1 }
        hash.key(hash.values.max)
    end

    def recipes
        RecipeCard.all.select { |recipecard| recipecard.recipe == self }
    end
        
    def users
        recipes.map { |recipe| recipe.user }
    end

    def recipe_ingredients
        RecipeIngredient.all.select { |recipe_ingredient| recipe_ingredient.recipe == self }
    end

    def ingredients
        recipe_ingredients.map { |recipe| recipe.ingredient }
    end

    def add_ingredients(arr_ingredients_inst)
        ingredient_array = []
        arr_ingredients_inst.each do |ingredient|
            ingredient_array << RecipeIngredient.new(ingredient, self)
        end
        ingredient_array
    end

    def allergens
        allergy_array = Allergy.all.map { |allergy| allergy.ingredient }
        ingredients.select { |ingredient_inst| allergy_array.include?(ingredient_inst)}
    end

    

    def self.all
        @@all
    end

end