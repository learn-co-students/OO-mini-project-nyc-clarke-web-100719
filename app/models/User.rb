# class User
#     attr_reader :name

#     @@all = []
#     def initialize(name)
#         @name = name
#         @@all << self
#     end

#     def self.all
#         @@all
#     end

#     def recipe_cards
#         RecipeCard.all.select { |recipecard| recipecard.user == self }
#     end

#     def recipes
#         recipe_cards.map { |recipe_card| recipe_card.recipe }
#     end

#     def add_recipe_card(date, rating, recipe)
#         RecipeCard.new(date, rating, self, recipe)
#     end

#     def allergy_instances
#         Allergy.all.select { |allergy| allergy.user == self }
#     end

#     def ingredients
#         allergy_instances.map { |allergy| allergy.ingredient }
#     end

#     def declare_allergy(ingredient_instance)
#         if ingredients.include?(ingredient_instance)
#             allergens << ingredient_instance
#         else
#             "Sorry, this isn't an ingredients we've heard of. Fuck off"
#         end
#     end

# end

class User
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def recipe_cards
        RecipeCard.all.select { |recipecard| recipecard.user == self }
    end
        
    def recipes
        recipe_cards.map { |recipe_card| recipe_card.recipe }
    end

    def add_recipe_card(date, rating, recipe)
        RecipeCard.new(date, rating, self, recipe)
    end    

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end

    def allergens
        Allergy.all.select { 
            |allergy| allergy.user == self 
        }.map { |allergy| allergy.ingredient }
    end

    def ratings
        recipe_cards.map { |recipe_card| recipe_card.rating }
    end

    def top_three_recipes
        rating_arr = recipe_cards.sort_by { |recipe_card| recipe_card.rating }
        rating_arr[-3..-1].map { |rating_card| rating_card.recipe }
    end

    def most_recent_recipe
        recipes[-1]
    end

end