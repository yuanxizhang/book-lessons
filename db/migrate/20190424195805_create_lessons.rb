class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :title
    	t.string :about
      t.decimal :price
      t.interger :points
      t.interger :seats
      t.datetime :start_time
      t.datetime :end_time
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :instructor_id
      t.integer :skill_id

      t.timestamps null: false
    end
  end
end
