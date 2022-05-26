class CreateInvites < ActiveRecord::Migration[7.0]
  def change
    create_table :invites do |t|
      t.references :condominium, null: false, foreign_key: { to_table: :condominiums }
      t.references :user, null: false, foreign_key: true
      t.integer :status, null: false, default: 0
      t.string :token
      t.timestamp :expires_at

      t.timestamps
    end
  end
end
