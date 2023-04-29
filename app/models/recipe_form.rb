class RecipeForm
  include ActiveModel::Model 

  attr_accessor(
    :recipe_title, :caption, :cooking_time, :image, :user_id,
    :id, :created_at, :updated_at,
    :ingredient_name 
  )

  with_options presence: true do 
    validates :recipe_title
    validates :caption 
    validates :image 
    validates :cooking_time 
  end

  def save 
    recipe = Recipe.create(recipe_title: recipe_title, caption: caption, cooking_time: cooking_time, image: image, user_id: user_id)
    if ingredient_name.present?
      ingredient.where(ingredient_name: ingredient_name).first_or_initialize
      ingredient.save
      RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingredient.id)
    end
  end
end