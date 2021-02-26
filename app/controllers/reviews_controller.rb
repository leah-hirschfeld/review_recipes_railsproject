class ReviewsController < ApplicationController
    before_action :recipe_find, :redirect_if_not_owner, only: [:show, :update, :edit, :destroy]

    def new
        @review = Review.new
        @review.build_recipe
    end

    def create
        @review = current_user.shoes.build(review_params)
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
            params.require(:review).permit(:stars, :comment, :review_id, :user_id, recipes_attributes: [:title, :ingredients, :instructions])
        end

        def redirect_if_not_owner
            if current_user != @review.user
                redirect_to user_path(current_user), alert: "Not your recipe!"
            end
        end
end
