class Review < ApplicationRecord
    belongs_to :recipe
    belongs_to :user
    #accepts_nested_attributes_for :recipe

    validates :comment, presence: true

    def recipes_attributes=(attr)
        self.recipe = Recipe.find_or_create_by(title: attr[:title])
    end

end
