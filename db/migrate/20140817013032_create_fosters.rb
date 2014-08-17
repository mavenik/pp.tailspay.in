class CreateFosters < ActiveRecord::Migration
  def change
    create_table :fosters, inherits: :users do |t|

      t.timestamps
    end
  end
end
