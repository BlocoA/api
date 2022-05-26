class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.references :condominium, null: false, foreign_key: { to_table: :condominiums }
      t.string :identifier, null: false

      t.timestamps
    end
  end
end
