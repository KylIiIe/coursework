class Book < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :genres

  validates :title, presence: true, uniqueness: true
  validates :descr, presence: true
  validates :count_pages, presence: true
  validates :status, presence: true
  validates :genres, presence: false
  validates :authors, presence: false

  def self.add_book(title, descr, count_pages, status, author_ids, genre_ids)
    authors = Author.find(author_ids)
    genres = Genre.find(genre_ids)
    book = Book.new(title:, descr:, count_pages:, status:, authors:, genres:)
    if book.valid?
      Book.save
      Book.last
    else
      puts book.errors.full_messages
      nil
    end
  end

  def self.update_book(id, title, descr, count_pages, status)
    book = Book.find(id)
    new_book = Book.new(title:, descr:, count_pages:, status:, authors:, genres:)
    if new_book.valid?
      book.update(title:, descr:, count_pages:, status:, authors:, genres:)
      Book.find(id)
    else
      puts new_book.errors.full_messages
      nil
    end
  end
end
