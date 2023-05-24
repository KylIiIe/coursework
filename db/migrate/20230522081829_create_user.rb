class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :city
      t.integer :phone_number

      t.timestamps
    end
  end
end