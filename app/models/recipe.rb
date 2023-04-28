class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :recipe_title, null: false
  validates :caption, null: false
end
