class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :email
      t.string :password_digest
      t.string :provider, null: false
			t.string :uid, null: false
      t.boolean :admin, :default => false 
      t.timestamps null: false 
      add_index :users, :provider
			add_index :users, :uid
			add_index :users, [:provider, :uid], unique: true 
    end
  end
end
