class CreateListItems < ActiveRecord::Migration[7.0]
  def change
    create_table :list_items do |t|
      t.string :title
      t.string :priority
      t.date :due_date
      t.boolean :done
      t.references :todo_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
