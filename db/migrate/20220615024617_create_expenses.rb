class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :contractee
      t.decimal :amount
      t.timestamp :spent_at
      t.integer :expense_type
      t.string :description
      t.references :condominium, null: false, foreign_key: { to_table: :condominiums }

      t.timestamps
    end
  end
end
