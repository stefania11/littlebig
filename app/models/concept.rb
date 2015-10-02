class Concept < ActiveRecord::Base
  has_many :topics
  has_many :prompts, through: :topics

  before_save :normalize_name

  def to_s
    "##{name.downcase}"
  end

  private

  def normalize_name
    self.name = name.downcase.titleize
  end
end
