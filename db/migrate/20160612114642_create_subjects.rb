class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.references :subjectable, polymorphic: true

      t.timestamps
    end
    add_index :subjects, :user_id
  end
end
