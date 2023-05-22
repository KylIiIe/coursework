class AddBooksToUsers2 < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :book_id
    add_reference :books, :user, null: false, foreign_key: true, default: 1
  end
end
