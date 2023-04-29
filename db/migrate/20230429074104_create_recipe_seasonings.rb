class CreateRecipeSeasonings < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_seasonings do |t|
      t.references :recipe, foreign_key: true
      t.references :seasoning, foreign_key: true
      t.timestamps
    end
  end
end
