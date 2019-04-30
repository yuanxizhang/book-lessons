class ChangeColumnLessons < ActiveRecord::Migration[5.2]
  def change
    change_column :lessons, :about, :text
  end
end
