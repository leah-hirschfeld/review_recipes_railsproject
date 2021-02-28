class Recipe < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    accepts_nested_attributes_for :reviews

    validates :title, presence: true, uniqueness: true
    validates :ingredients, :instructions, presence: true
    
    def self.ordered_alphabetically
        self.order(title: :asc)
    end

end
