class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipe_seasonings
  has_many :seasonings, through: :recipe_seasonings
  has_many :recipe_procedures
  has_many :procedures, through: :recipe_procedures

  validates :recipe_title, null: false
  validates :caption, null: false
end
