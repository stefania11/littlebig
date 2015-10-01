class Prompt < ActiveRecord::Base
  belongs_to :source, class_name: 'Prompt'
  has_many :responses, class_name: 'Prompt', foreign_key: 'source_id'

  has_many :topics
  has_many :concepts, through: :topics

  has_many :relationships
  has_many :characters, through: :relationships

  def prompt_id=(id)
    Prompt.find(id).responses << self
  end

  def source
    value = super
    if value
      value
    else
      'No source yo!'
    end
  end
end
