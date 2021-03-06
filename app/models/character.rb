class Character < ActiveRecord::Base
  belongs_to :user
  has_many :relationships
  has_many :prompts, through: :relationships
  has_many :concepts, through: :prompts
  before_save :normalize_name

  validates :name, uniqueness: true, presence: true

  def concepts
    super.uniq
  end


  def to_s
    "@#{name.gsub(/[ \.]/, '')}"
  end

  private

  def normalize_name
    name.downcase.titleize
  end
end
