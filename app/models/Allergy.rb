# class Allergy
#     attr_reader :user, :ingredient, @allergens
#     @@all = []

#     def initialize(user, ingredient)
#         @@all << self
#         @user = user
#         @ingredient = ingredient
#     end

#     def self.all
#         @@all
#     end

#     # def allergic?
#     #     # if ingredient.include?(allergens)
#     #         #do something
#     #     end
#     # end
# end

class Allergy
    attr_reader :user, :ingredient
    
    @@all = []

    def initialize (user, ingredient)
        @user = user
        @ingredient = ingredient
        @@all << self
    end

    def self.all
        @@all
    end

    def self.most_common_allergen
        hash = Hash.new(0)
        Allergy.all.each { |allergy| hash[allergy.ingredient] += 1 }
        hash.key(hash.values.max)
    end
end