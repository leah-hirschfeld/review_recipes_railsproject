class Review < ApplicationRecord
    belongs_to :recipe
    belongs_to :user
    accepts_nested_attributes_for :recipe

    validates :comment, presence: true
end
