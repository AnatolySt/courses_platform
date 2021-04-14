class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :recovery_password_digest
      t.string :auth_token

      t.timestamps
    end
  end
end
