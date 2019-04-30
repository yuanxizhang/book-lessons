class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.integer :lesson_id
      t.string :name

      t.timestamps null: false
    end
  end
end
