class Character < ActiveRecord::Base
  has_many :relationships
  has_many :prompts, through: :relationships
  before_save :normalize_name

  def normalize_name
    name.downcase.titleize
  end

  def to_s
    "##{name}"
  end
end
