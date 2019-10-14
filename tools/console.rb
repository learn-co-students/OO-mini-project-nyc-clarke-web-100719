require_relative '../config/environment.rb'

r1 = Recipe.new("chili")
r2 = Recipe.new("omellete")
r3 = Recipe.new("burger")
r4 = Recipe.new("tea")
r5 = Recipe.new("Impossible Meat")

u1 = User.new("babz")
u2 = User.new("jimsssss")

i1 = Ingredient.new("pepper")
i2 = Ingredient.new("egg")
i3 = Ingredient.new("garlic")

a1 = u1.declare_allergy(i3, 3)
a2 = u1.declare_allergy(i2, 4)
a3 = u1.declare_allergy(i1, 1)
a4 = u2.declare_allergy(i2, 1)


rc1 = RecipeCard.new(u1, r1, "10/14/19", 4)
rc2 = RecipeCard.new(u1, r2, "10/17/19", 5)
rc3 = RecipeCard.new(u1, r2, "10/01/19", 5)
rc4 = RecipeCard.new(u1, r2, "10/01/19", 5)
rc6 = RecipeCard.new(u1, r3, "10/12/19", 1)
rc5 = RecipeCard.new(u1, r4, "10/12/19", 2)
rc7 = RecipeCard.new(u2, r3, "10/12/19", 1)


ri1 = RecipeIngredient.new(i1, r1) 
ri2 = RecipeIngredient.new(i2, r2) 
ri3 = RecipeIngredient.new(i1, r2) 
ri4 = RecipeIngredient.new(i3, r2) 

r5.add_ingredients([i2,i3])





binding.pry
