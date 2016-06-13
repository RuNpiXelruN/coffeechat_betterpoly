class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.references :user, foreign_key: true
      t.references :locationable, polymorphic: true
      t.string :suburb

      t.timestamps
    end
  end
end
