class Recipe < ApplicationRecord
  belongs_to :user

  validates :recipe_title, null: false
  validates :caption, null: false
end
