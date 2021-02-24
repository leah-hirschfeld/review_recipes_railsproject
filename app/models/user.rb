class User < ApplicationRecord
    has_many :reviews
    has_many :recipes, through: :review

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
