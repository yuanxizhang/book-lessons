class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :instructors, :email, :bio
    rename_column :instructors, :phone_number, :class_time
  end
end
