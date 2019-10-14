class RecipeCard

    attr_accessor :user, :recipe, :rating, :date #date possible could be just a reader

    @@all =[]

    def self.all
        @@all
    end

    def initialize(user, recipe, date, rating)
        @user = user
        @recipe = recipe
        @date = date
        @rating = rating

        self.class.all << self
    end

end