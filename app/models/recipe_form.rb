class RecipeForm
  include ActiveModel::Model 

  attr_accessor(
    :recipe_title, :caption, :cooking_time, :image, :user_id,
    :id, :created_at, :updated_at,
    :ingredient_name, :seasoning_name, :step
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
      ingredient = Ingredient.where(ingredient_name: ingredient_name).first_or_initialize
      ingredient.save
      RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingredient.id)
    end
    if seasoning_name.present?
      seasoning = Seasoning.where(seasoning_name: seasoning_name).first_or_initialize
      seasoning.save
      RecipeSeasoning.create(recipe_id: recipe.id, seasoning_id: seasoning.id)
    end
    if step.present?
      procedure = Procedure.where(step: step).first_or_initialize
      procedure.save
      RecipeProcedure.create(recipe_id: recipe.id, procedure_id: procedure.id)
    end
  end
end