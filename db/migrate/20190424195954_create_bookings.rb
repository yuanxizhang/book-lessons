class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :lesson_id
      t.string :full_name
      t.string :phone
      t.string :card_token

      t.timestamps null: false
    end
  end
end
