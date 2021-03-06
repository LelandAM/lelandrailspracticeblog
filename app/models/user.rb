class User < ApplicationRecord

  has_many :posts
  has_many :comments

  validates :email, presence: true
  validates :username, presence: true
  validates :password, presence: true

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def authenticate(password)
    self.password == password
  end
end