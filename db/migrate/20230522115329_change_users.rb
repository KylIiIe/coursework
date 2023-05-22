class ChangeUsers < ActiveRecord::Migration[7.0]
  change_table :users do |t|
    t.string :name
    t.string :city
    t.integer :phone_number

  end
end
