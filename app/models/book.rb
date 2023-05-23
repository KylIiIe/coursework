class Book < ApplicationRecord
  belongs_to :deal, optional: true
  belongs_to :genre
  belongs_to :user
  has_and_belongs_to_many :authors

  validates :title, presence: true
  validates :descr, presence: true
  validates :count_pages, presence: true
  validates :status, presence: true
  validates :genre, presence: true
  validates :authors, presence: true
  validates :user, presence: true

  def self.add_book(title, descr, count_pages, status, genre_id, author_ids, user_id)
    user = User.find(user_id)
    genre = Genre.find(genre_id)
    authors = Author.find(author_ids)
    book = Book.new(title:, descr:, count_pages:, status:, genre:, authors:, user:)
    if book.valid?
      book.save
      Book.last
    else
      puts book.errors.full_messages
      nil
    end
  end

  def self.update_book(id, title, descr, count_pages, status, genre_id, author_ids)
    book = Book.find(id)
    genre = Genre.find(genre_id)
    authors = Author.find(author_ids)
    new_book = Book.new(title:, descr:, count_pages:, status:, genre:, authors:)
    if new_book.valid?
      book.update(title:, descr:, count_pages:, status:)
      Book.find(id)
    else
      puts new_book.errors.full_messages
      nil
    end
  end

  def self.delete_book_id (id)
    book = Book.find(id)
    book.authors = []
    book.delete
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
