class AddBooksToUsers1 < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :user, null: false, foreign_key: true, default: 1
  end
end