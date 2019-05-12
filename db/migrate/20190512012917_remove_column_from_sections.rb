class RemoveColumnFromSections < ActiveRecord::Migration[5.2]
  def change
    remove_column :sections, :lesson_id, :integer
  end
end
