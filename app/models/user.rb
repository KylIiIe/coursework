class User < ApplicationRecord
  has_many :books
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :city, presence: true
  validates :phone_number, presence: true

  def self.add_user(name, email, city, phone_number)
    user = User.new(name:, email:, city:, phone_number:)
    if user.valid?
      User.save
      User.last
    else
      puts user.errors.full_messages
      nil
    end
  end

  def self.update_user(id, name, email, city, phone_number)
    user = User.find(id)
    new_user = User.new(name:, email:, city:, phone_number:)
    if new_user.valid?
      user.update(name:, email:, city:, phone_number:)
      User.find(id)
    else
      puts new_user.errors.full_messages
      nil
    end
  end

  def self.ban_user(id)
    user = User.find(id)
    baned = true
    user.update(baned:)
  end

  def self.unban_user(id)
    user = User.find(id)
    baned = false
    user.update(baned:)
  end
end
