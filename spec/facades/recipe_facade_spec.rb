require 'rails_helper'

RSpec.describe 'Recipe Facade' do 
    describe 'class methods' do 
        it 'can return recipes by name', :vcr do 
            recipe_name = "peas"
            recipes = RecipesFacade.find_recipes_by_name(recipe_name)
            expect(recipes).to be_a(Array)
            expect(recipes.first.name.downcase).to include(recipe_name)
        end

        it 'will return an array of objects based on area', :vcr do 
            recipes = RecipesFacade.find_recipes_by_area("British")
            expect(recipes).to be_an(Array)
            expect(recipes[0]).to be_a(Recipe)
            expect(recipes[0].name).to be_a(String)
            expect(recipes[0].id).to be_a(String)
            expect(recipes[0].image).to be_a(String)
            expect(recipes[0].area).to eq (nil)
            expect(recipes[0].category).to eq (nil)
            expect(recipes[0].ingredients).to be_a(Hash)

            expect(recipes.last).to be_a(Recipe)
        end

        it 'will return an array of objects based on an ingredient search', :vcr do
            recipes = RecipesFacade.find_recipes_by_ingredient('tomato')
            expect(recipes).to be_an(Array)
            expect(recipes[0]).to be_a(Recipe)
            expect(recipes[0].name).to be_a(String)
            expect(recipes[0].id).to be_a(String)
            expect(recipes[0].image).to be_a(String)
            expect(recipes[0].area).to eq (nil)
            expect(recipes[0].category).to eq (nil)
            expect(recipes[0].ingredients).to be_a(Hash)
        end

        it 'will return an array of Recipes based on a category', :vcr do 
            recipes = RecipesFacade.find_recipes_by_category('dessert')
            expect(recipes).to be_an(Array)
            expect(recipes[0]).to be_a(Recipe)
            expect(recipes[0].name).to be_a(String)
            expect(recipes[0].id).to be_a(String)
            expect(recipes[0].image).to be_a(String)
            expect(recipes[0].area).to eq (nil)
            expect(recipes[0].category).to eq (nil)
            expect(recipes[0].ingredients).to be_a(Hash)
            expect(recipes.last).to be_a(Recipe)
        end

        it 'will return a single recipe based on id', :vcr do 
            recipe = RecipesFacade.find_recipe_by_id('52893')
            expect(recipe).to be_a(Recipe)
            expect(recipe.id).to eq("52893")
            expect(recipe.category).to eq("Dessert")
            expect(recipe.ingredients).to have_key("Plain Flour")
        end

        xit 'having a bad value for search by name will return a 404', :vcr do 
            recipe_name = "foobar"
            RecipesFacade.find_recipes_by_name(recipe_name)
        end
        
        xit 'having a bad value for ingredient will return a 404', :vcr do 
            ingredient = "foobar"
            RecipesFacade.find_recipes_by_ingredient(ingredient)
        end

        xit 'having a bad value for id will return a 404', :vcr do 
            id = 548846512545
            RecipesFacade.find_recipe_by_id(id)
        end
    end 
end