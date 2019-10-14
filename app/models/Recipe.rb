class Recipe

    attr_accessor :recipe_name

    @@all =[]

    def self.all
        @@all
    end

    def initialize(recipe_name)
        @recipe_name = recipe_name
        self.class.all << self
    end

    def cards
        RecipeCard.all.select{|card| card.recipe == self}
    end

    def cards_count
        cards.count
    end

    def self.most_popular
        all.sort_by{|recipe| -recipe.cards_count}.first
    end

    def users
        cards.map{|card| card.user}
    end

    def ingredients
        RecipeIngredient.all.select{|re_in| re_in.recipe == self}.map{|re_in| re_in.ingredient}
    end

    def allergens
        al_in = Allergy.all.map{|allergen| allergen.ingredient}
        al_in.select{|ingredient| self.ingredients.any?(ingredient)}
    end

    def add_ingredients(array_ingredients)
        array_ingredients.each{|ingredient_tb_added| RecipeIngredient.new(self, ingredient_tb_added)}
    end

end