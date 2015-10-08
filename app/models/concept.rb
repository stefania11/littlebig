class Concept < ActiveRecord::Base
  belongs_to :user
  has_many :topics
  has_many :prompts, through: :topics
  has_many :characters, through: :prompts
  has_many :responses, class_name: 'Prompt', foreign_key: 'source_id'
  has_many :responders, through: :responses, source: 'user'

  validates :name, uniqueness: true, presence: true

  before_save :normalize_name
  
  def last_response_by(user)
    responses.where(user_id: user).last
  end

  def characters
    super.uniq
  end

  def to_s
    "##{name.downcase}"
  end

  private

  def normalize_name
    self.name = name.downcase.titleize
  end
end
