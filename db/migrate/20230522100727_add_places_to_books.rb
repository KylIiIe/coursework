class AddPlacesToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :place, null: false, foreign_key: true, default: 1
  end
end
