class AddPictureToInstructors < ActiveRecord::Migration[5.2]
  def change
    add_column :instructors, :picture, :string
  end
end
