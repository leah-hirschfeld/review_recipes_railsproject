class ReviewsController < ApplicationController
    before_action :review_find, :redirect_if_not_owner, only: [:show, :update, :edit, :destroy]

    def new
        if params[:recipe_id] && @recipe = Recipe.find_by_id(params[:recipe_id])
            @review = @recipe.reviews.build
        else
            @review = Review.new
            @review.build_recipe
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
    end
    
    def edit
    end

    def update
        @review.update(review_params)
        if @review.valid?
            @review.save
            redirect_to review_path(@review)
        else
            render :edit
        end
    end

    def index
        if params[:recipe_id] && @recipe = Recipe.find_by_id(params[:recipe_id])
            @reviews = @recipe.reviews
        else
            @reviews = Review.all
        end
    end

    def destroy
        review_find.destroy
        redirect_to reviews_path
    end 

    private
        def review_find
            @review = Review.find(params[:id])
        end

        def review_params
            params.require(:review).permit(:stars, :comment, :user_id, :recipe_id, recipes_attributes: [:title, :ingredients, :instructions, :user_id])
        end

        def redirect_if_not_owner
            if current_user != @review.user
                redirect_to user_path(current_user), alert: "Not your recipe!"
            end
        end
end
