class CreateReview < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :descr

      t.timestamps
    end
  end
end
