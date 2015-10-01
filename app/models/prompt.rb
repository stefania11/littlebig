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

  def concept_id=(id)
    Concept.find(id).prompts << self
  end

  def concept_list=(string)
    concept_list = string.scan(/\w+/).map do |name|
      Concept.find_or_create_by(name: name.downcase.titleize)
    end

    self.concepts = concepts + concept_list
  end
end
