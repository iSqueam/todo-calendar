class AddColumnsToTaskItem < ActiveRecord::Migration[7.0]
  def change
    add_column :task_items, :description, :text
    add_column :task_items, :date, :datetime
    add_column :task_items, :priority, :integer
    add_column :task_items, :completed, :boolean
  end
end
