class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }

  has_attachment :avatar, accept: [:jpg, :png, :gif]
  validates :avatar, presence: true
end
