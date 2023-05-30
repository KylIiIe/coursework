class Book < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_and_belongs_to_many :authors
  has_one_attached :image

  validates :title, presence: true
  validates :descr, presence: true
  validates :count_pages, presence: true
  validates :status, presence: true
  validates :user, presence: true

  def self.add_book(title, descr, count_pages, status, genre_id, user_id, author_ids, image)
    user = User.find(user_id)
    genre = Genre.find(genre_id)
    authors = Author.find(author_ids)
    book = Book.new(title:, descr:, count_pages:, status:, authors:, genre:, user:, image:)
    if book.valid?
      book.save
      Book.last
    else
      puts book.errors.full_messages
      nil
    end
  end

  def self.update_book(id, params)
    book = Book.find(id)
    params[:genre] = Genre.find(params[:genre_id])
    params[:user] = User.find(params[:user_id])
    params[:authors] = Author.find(params[:author_ids])
    params.delete(:genre_id)
    params.delete(:user_id)
    params.delete(:author_ids)
    new_book = Book.new(params)
    if new_book.valid?
      book.update(params)
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
    book.genre << genre
  end
end