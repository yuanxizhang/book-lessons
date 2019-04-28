class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :instructor_id
      t.integer :rating
      t.string :content

      t.timestamps null: false
    end
  end
end
