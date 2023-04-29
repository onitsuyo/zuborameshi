class CreateSeasonings < ActiveRecord::Migration[6.0]
  def change
    create_table :seasonings do |t|
      t.string :seasoning_name, null: false, uniqueness: true
      t.timestamps
    end
  end
end
