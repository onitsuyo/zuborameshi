class CreateRecipeProcedures < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_procedures do |t|
      t.references :recipe
      t.references :procedure
      t.timestamps
    end
  end
end
