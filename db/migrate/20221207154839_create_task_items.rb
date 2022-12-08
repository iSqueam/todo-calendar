class CreateTaskItems < ActiveRecord::Migration[7.0]
  def change
    create_table :task_items do |t|
      t.string :title
      t.text :description
      t.datetime :date
      t.integer :priority
      t.boolean :completed
      t.references :task_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
