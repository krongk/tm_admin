class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :user
      t.string :auth_type
      t.string :auth_id
      t.string :auth_token
      t.time :token_created_at
      t.boolean :token_confirmed, default: false
      t.time :current_sign_in_at
      t.string :last_sign_in_at

      t.timestamps
    end
  end
end
