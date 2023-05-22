class Review < ApplicationRecord
  belongs_to :user

  validescrs :title, presence: true
  validescrs :descr, presence: true

  def self.add_review(title, descr, user_id)
    user = User.find(user_id)
    review = Review.new(title:, descr:, user:)
    if review.valid?
      Review.save
      Review.last
    else
      puts review.errors.full_messages
      nil
    end
  end

  def self.update_review(id, title, descr, user_id)
    user = User.find(user_id)
    review = Review.find(id)
    new_review = Review.new(title:, descr:, user:)
    if new_review.valid?
      review.update(title:, descr:, user:)
      Review.find(id)
    else
      puts new_review.errors.full_messages
      nil
    end
  end
end
