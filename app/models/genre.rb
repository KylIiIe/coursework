class Genre < ApplicationRecord
  has_and_belongs_to_many :books

  validates :title, presence: true, uniqueness: true

  def self.add_genre(title)
    genre = Genre.new(title:)
    if genre.valid?
      Genre.save
      Genre.last
    else
      puts genre.errors.full_messages
      nil
    end
  end

  def self.update_genre(id, title)
    genre = Genre.find(id)
    new_genre = Genre.new(title:)
    if new_genre.valid?
      genre.update(title:)
      Genre.find(id)
    else
      puts new_genre.errors.full_messages
      nil
    end
  end
end
