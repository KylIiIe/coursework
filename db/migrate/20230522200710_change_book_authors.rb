class ChangeBookAuthors < ActiveRecord::Migration[7.0]
  def change
    drop_table :book_authors
    add_reference :books, :author, null: false, foreign_key: true, default: 1
  end
end
