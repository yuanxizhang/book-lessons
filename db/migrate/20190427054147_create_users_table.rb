class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :provider
      t.string :uid
      t.string :google_token
      t.string :google_refresh_token
      t.integer :points
      t.boolean :admin, :default => false
      t.timestamps null: false
    end
  end
end
