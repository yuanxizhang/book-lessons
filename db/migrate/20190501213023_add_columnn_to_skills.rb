class AddColumnnToSkills < ActiveRecord::Migration[5.2]
  def change
    add_column :skills, :section_id, :integer
  end
end
