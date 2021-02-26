class RecipesController < ApplicationController
    before_action :recipe_find, only: [:show, :update, :edit, :destroy]

    def new
        @recipe = Recipe.new
        @recipe.reviews.build
    end

    def index
        @recipes = Recipe.all
    end

    def show
    end
    
    def create
        #@recipe = Recipe.new(recipe_params)
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.valid?
            @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @recipe.update(recipe_params)
        if @recipe.valid?
            @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
    end

    def destroy
        recipe_find.destroy
        redirect_to recipes_path
    end

    private
    def recipe_find
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:title, :ingredients, :instructions, reviews_attributes: [:stars, :comment])
    end

end
