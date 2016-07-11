class Post < ApplicationRecord
  # destroys comments if post gets deleted
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true
end