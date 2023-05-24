class AddReviewsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :review, null: false, foreign_key: true, default: 1
  end
end