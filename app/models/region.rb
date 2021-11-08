class Region < ApplicationRecord

    has_many :dishes
    has_many :users, through: :dishes
    
    validates_presence_of :continent
end
