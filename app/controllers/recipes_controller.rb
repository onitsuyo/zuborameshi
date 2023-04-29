class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe_form = RecipeForm.new 
  end

  def create
    @recipe_form =  RecipeForm.new(recipe_form_params)
    if @recipe_form.valid?
      @recipe_form.save
      redirect_to root_path
    else
      render :new 
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @seasonings = @recipe.seasonings
    @procedures = @recipe.procedures
  end
  
  private

  def recipe_form_params
    params.require(:recipe_form).permit(:recipe_title, :caption, :cooking_time, :ingredient_name, :seasoning_name, :step, :image).merge(user_id: current_user.id)
  end 
end
