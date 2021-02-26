module ReviewsHelper     
    def display_header(recipe)
        if recipe
            tag.h1("All #{recipe.title}'s Reviews")
        else
            tag.h1("All the Reviews")
        end
    end
end
