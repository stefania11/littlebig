class User < ActiveRecord::Base
  has_many :prompts
  has_many :characters
  has_many :concepts

  has_many :collections
  has_many :collected_prompts, through: :collections, source: 'prompt'

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }

  def to_s
    username
  end

  def can_collect?(prompt)
    (self != prompt.user) && (collected_prompts.exclude? prompt)
  end
end
