class Procedure < ApplicationRecord
  has_many :recipe_procedures
  has_many :recipe, through: :recipe_procedures

  validates :step, uniqueness: true
end
