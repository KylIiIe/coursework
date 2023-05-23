class Review < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :descr, presence: true

  def self.add_review(title, descr, user_id)
    user = User.find(user_id)
    review = Review.new(title:, descr:, user:)
    if review.valid?
      review.save
      Review.last
    else
      puts review.errors.full_messages
      nil
    end
  end

  def self.update_review(id, title, descr)
    review = Review.find(id)
    new_review = Review.new(title:, descr:)
    if new_review.valid?
      review.update(title:, descr:)
      Review.find(id)
    else
      puts new_review.errors.full_messages
      nil
    end
  end

  def self.delete_review_id (id)
    review_id = Review.find(id)
    review_id.delete
  end
end
