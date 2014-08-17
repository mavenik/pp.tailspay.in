class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :type, null: false

      t.unique_constraint [:email]

      t.timestamps
    end
  end
end
