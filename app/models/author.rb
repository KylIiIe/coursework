class Author < ApplicationRecord
  belongs_to :book

  validates :name, presence: true, uniqueness: true

  def self.add_author(name)
    author = Author.new(name:)
    if author.valid?
      connection.execute("INSERT INTO authors (name) VALUES ('#{name}')")
      Author.last
    else
      puts author.errors.full_messages
      nil
    end
  end

  def self.update_author(id, name)
    author = Author.find(id)
    new_author = Author.new(name:)
    if new_author.valid?
      author.update(name:)
      Author.find(id)
    else
      puts new_author.errors.full_messages
      nil
    end
  end

  def self.delete_author_id (id)
    connection.execute("DELETE FROM authors WHERE id = #{id}")
  end
end
