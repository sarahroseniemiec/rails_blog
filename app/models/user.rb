class User < ApplicationRecord

  # destroys the posts and comments of user if they delete their account
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  # sets the minimum password length to five characters
  validates :password, length: { minimum: 5 }
end
