class Dish < ApplicationRecord
    belongs_to :user
    belongs_to :region

    validates_presence_of :name, :ingredients
end
