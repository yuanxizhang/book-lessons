class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :lessons, :points, :integer
    remove_column :users, :points, :interger
  end
end
