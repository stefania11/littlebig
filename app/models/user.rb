class User < ActiveRecord::Base
  has_many :prompts
  has_many :characters
  has_many :concepts

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }

  has_attachment :avatar, accept: [:jpg, :png, :gif, :jpeg]
  # validates :avatar, presence: true
end
