class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :name
      t.string :description
      t.references :category, foreign_key: true, on_delete: :cascade
      t.references :user, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
