class ReviewsController < ApplicationController

    def new
        @review = Review.new
        @review.build_recipe
    end

    def create
        @review = Review.new(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
        @review = Review.find(params[:id])
    end
    
    def edit
    end

    def index
        @reviews = Review.all
    end

    private
        def review_params
            params.require(:review).permit(:stars, :comment, recipes_attributes: [:title, :ingredients, :instructions])
        end
end
