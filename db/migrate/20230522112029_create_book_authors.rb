class CreateBookAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :book_authors do |t|
      t.references :book, null: false, foreign_key: true
      t.references :authors, null: false, foreign_key: true
    end
  end
end
