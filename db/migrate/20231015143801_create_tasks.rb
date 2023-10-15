class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :description
      t.integer :position
      t.boolean :completed

      t.timestamps
    end
  end
end
