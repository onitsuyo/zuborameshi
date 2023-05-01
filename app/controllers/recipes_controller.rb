class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
    recipe_attributes = @recipe.attributes
    @recipe_form = RecipeForm.new(recipe_attributes)
    @recipe_form.ingredient_name = @recipe.ingredients.map(&:ingredient_name)
    @recipe_form.seasoning_name = @recipe.seasonings.map(&:seasoning_name)
    @recipe_form.step = @recipe.procedures.map(&:step)
  end

  def update
    @recipe_form = RecipeForm.new(recipe_form_params)
    @recipe_form.image ||= @recipe.image.blob
    if @recipe_form.valid?
      @recipe_form.update(recipe_form_params, @recipe)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @recipe.destroy
      redirect_to root_path
    end
  end
  
  private

  def recipe_form_params
    params.require(:recipe_form).permit(:recipe_title, :caption, :cooking_time, :ingredient_name, :seasoning_name, :step, :image).merge(user_id: current_user.id)
  end 

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
