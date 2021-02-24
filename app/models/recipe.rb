class Recipe < ApplicationRecord
    has_many :reviews
    has_many :users, through: :review

    validates :title, presence: true, uniqueness: true
    validates :ingredients, presence: true
    validates :instructions, presence: true
end
