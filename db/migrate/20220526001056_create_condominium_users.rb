class CreateCondominiumUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :condominium_users do |t|
      t.references :condominium, null: false, foreign_key: { to_table: :condominiums }
      t.references :user, null: false, foreign_key: true
      t.integer :user_role

      t.timestamps
    end
  end
end
