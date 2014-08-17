class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors, inherits: :users do |t|

      t.timestamps
    end
  end
end
