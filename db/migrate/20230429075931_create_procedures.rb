class CreateProcedures < ActiveRecord::Migration[6.0]
  def change
    create_table :procedures do |t|
      t.text :step, null: false, uniqueness: true
      t.timestamps
    end
  end
end
