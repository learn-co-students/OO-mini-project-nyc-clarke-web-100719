class User

    attr_accessor :name

    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def recipes_cards
        RecipeCard.all.select{|card| card.user == self}
    end

    def recipes
        recipes_cards.map{|card| card.recipe}
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, date, rating)
    end

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end

    def allergens
        Allergy.all.select{|allergy| allergy.user == self}.map{|allergy| allergy.ingredient}
    end

    def top_three_recipes
        recipes_cards.sort_by{|card| -card.rating}.first(3).map{|card| card.recipe}
    end

    def most_recent_recipe
        recipes.last
    end


    # BONUS:

    def safe_recipes
        instance_allergens = allergens
        return Recipe.all if instance_allergens.length == 0
        Recipe.all.reject{|ind_recipe| ind_recipe.ingredients.any?{ |ing| instance_allergens.any?(ing)}}
        # Going to all recipes => get ingredients for ind_recipe 
        # - ind ing of recipe check => if could be found as an allergen for the user - instances
    end
    #check logic
end