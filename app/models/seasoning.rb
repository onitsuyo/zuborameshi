class Seasoning < ApplicationRecord
  has_many :recipe_seasonings
  has_many :recipes, through: :recipe_seasonings
  
  validates :seasoning_name, uniqueness: true
end
