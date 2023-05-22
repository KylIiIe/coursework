class CreateBook < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :descr
      t.integer :count_pages
      t.boolean :status

      t.timestamps
    end
  end
end
