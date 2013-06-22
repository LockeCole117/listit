class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :list_id
      t.boolean :completed
      t.string :name

      t.timestamps
    end
  end
end
