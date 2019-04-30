class AddColumnToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :available, :boolean, :default => true
    add_column :lessons, :online, :boolean, :default => false
    add_column :lessons, :length, :string
    add_column :lessons, :requirement, :string
    add_column :lessons, :dates, :string
    add_column :lessons, :time, :string
    remove_column :lessons, :start_time, :datetime
    remove_column :lessons, :end_time, :datetime
  end
end
