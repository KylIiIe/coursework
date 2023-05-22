class Book < ApplicationRecord
  belongs_to :user
  has_many :authors
  has_and_belongs_to_many :genres

  validates :title, presence: true, uniqueness: true
  validates :descr, presence: true
  validates :count_pages, presence: true
  validates :status, presence: true
  validates :genres, presence: false
  validates :authors, presence: false

  def self.add_book(title, descr, count_pages, status)
    book = Book.new(title:, descr:, count_pages:, status:)
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
    new_book = Book.new(title:, descr:, count_pages:, status:)
    if new_book.valid?
      book.update(title:, descr:, count_pages:, status:)
      Book.find(id)
    else
      puts new_book.errors.full_messages
      nil
    end
  end

  def self.delete_book_id (id)
    book_id = Book.find(id)
    book_id.delete
  end

  def self.add_book_author(book_id, author_id)
    book = Book.find(book_id)
    author = Author.find(author_id)
    book.authors << author
  end

  def self.add_book_genre(book_id, genre_id)
    book = Book.find(book_id)
    genre = Genre.find(genre_id)
    book.genres << genre
  end
end
