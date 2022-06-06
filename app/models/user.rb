class User < ApplicationRecord
    # validates_presence_of :name 
    validates_uniqueness_of :email
    has_many :saved_recipes
end
