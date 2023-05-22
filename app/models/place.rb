class Place < ApplicationRecord
  belongs_to :book

  validates :address, presence: true, uniqueness: true
  validates :date, presence: true
  validates :book, presence: true

  def self.add_place(address, date, book_id)
    book = Book.find(book_id)
    place = Place.new(address:, date:, book:)
    if place.valid?
      Place.save
      Place.last
    else
      puts place.errors.full_messages
      nil
    end
  end

  def self.update_place(id, address, date, book_id)
    book = Book.find(book_id)
    place = Place.find(id)
    new_place = Place.new(address:, date:, book:)
    if new_place.valid?
      place.update(address:, date:, book:)
      Place.find(id)
    else
      puts new_place.errors.full_messages
      nil
    end
  end

  def self.delete_place_id (id)
    place_id = Place.find(id)
    place_id.delete
  end
end
