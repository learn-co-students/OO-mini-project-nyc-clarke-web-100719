require_relative '../config/environment.rb'

john = User.new("John") 
greg = User.new("Greg")  



sugar = Ingredient.new("Sugar")
butter = Ingredient.new("Butter")
eggs = Ingredient.new("Eggs")
flour = Ingredient.new("Flour")
chocolate = Ingredient.new("Chocolate")
bakingsoda = Ingredient.new("Baking Soda")
brownsugar = Ingredient.new("Brown Sugar")
vanilla = Ingredient.new("Vanilla Paste")
salt = Ingredient.new("Salt")
pork = Ingredient.new("pork")
peanuts = Ingredient.new("peanuts")
apples = Ingredient.new("apples")
crust = Ingredient.new("crust")
oats = Ingredient.new("oats")
berries = Ingredient.new("berries")
milk = Ingredient.new("milk")





ccingredients = [sugar, butter, salt, eggs, bakingsoda, brownsugar, vanilla, chocolate]
porkingredients = [pork, salt, peanuts]
pieingredients = [apples, crust]
oatmealingredients = [oats, berries, milk]


chocchip = Recipe.new("Chocolate Chip Cookies")
porkrecipe = Recipe.new("Pork")
pierecipe = Recipe.new("Pie")
oatmeal = Recipe.new("oatmeal")

chocchip.add_ingredients(ccingredients)
porkrecipe.add_ingredients(porkingredients)
pierecipe.add_ingredients(pieingredients)
oatmeal.add_ingredients(oatmealingredients)

johnallergy = Allergy.new(john, eggs)
gregallergy = Allergy.new(greg, peanuts)
johnallergy2 = Allergy.new(john, peanuts)

chocchipcard = RecipeCard.new("Jan 1", 10, john, chocchip)
chocchipcard2 = RecipeCard.new("Jan 2", 5.0, greg, chocchip)
porkcard = RecipeCard.new("Jan 3", 2.0, john, oatmeal)
porkcard2 = RecipeCard.new("Jan 3", 9, john, porkrecipe)
piecard = RecipeCard.new("Jan 1", 8, john, pierecipe)
chocchipcard3 = RecipeCard.new("Jan 5", 1.1, greg, chocchip)



# chocchipingredient = RecipeIngredient.new(ccingredients, chocchip)
# porkingredient = RecipeIngredient.new(porkingredients, pork)

binding.pry
