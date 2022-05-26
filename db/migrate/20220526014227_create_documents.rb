class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.references :condominium, null: false, foreign_key: { to_table: :condominiums }
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :month
      t.integer :year

      t.timestamps
    end
  end
end
