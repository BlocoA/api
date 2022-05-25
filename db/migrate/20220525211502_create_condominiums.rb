class CreateCondominiums < ActiveRecord::Migration[7.0]
  def change
    create_table :condominiums do |t|
      t.string :name, null: false
      t.integer :units_quantity
      t.boolean :has_leisure_area

      t.timestamps
    end
  end
end
