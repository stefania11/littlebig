class Concept < ActiveRecord::Base
  belongs_to :user
  has_many :topics
  has_many :prompts, through: :topics
  has_many :characters, through: :prompts

  validates :name, uniqueness: true, presence: true

  before_save :normalize_name

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
