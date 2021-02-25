class RecipesController < ApplicationController
    before_action :recipe_find, :redirect_if_not_owner, only: [:show, :update, :edit, :destroy]

    def index
        @recipes = Recipe.all
        @recipe = Recipe.new
    end

    def show
    end
    
    def new
        @recipe = Recipe.new
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
        @recipe = Recipe.find(params[:id])
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
        redirect_to recipes_url
    end

    private
    def recipe_find
        @recipe = Recipe.find(params[:id])
    end

    def recipe_params
        params.require(:recipe).permit(:title, :ingredients, :instructions)
    end

    def redirect_if_not_owner
        if current_user != @recipe.user
            redirect_to user_path(current_user), alert: "Not your recipe!"
        end
    end
end
