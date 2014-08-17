class CreateFurries < ActiveRecord::Migration
  def change
    create_table :furries do |t|
      t.string :name, null: false
      t.integer :location_id, references: :locations
      t.text :description

      t.timestamps
    end
  end
end
