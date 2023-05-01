class Procedure < ApplicationRecord
  has_many :recipe_procedures, dependent: :destroy
  has_many :recipe, through: :recipe_procedures

  validates :step, uniqueness: true
end
