class Prompt < ActiveRecord::Base
  belongs_to :user

  belongs_to :source, class_name: 'Prompt'
  has_many :responses, class_name: 'Prompt', foreign_key: 'source_id'
  has_many :responders, through: :responses, source: 'user'

  has_many :topics
  has_many :concepts, through: :topics

  has_many :relationships
  has_many :characters, through: :relationships

  has_many :collections
  has_many :collectors, through: :collections, source: 'user'

  has_attachment :image

  validates :body, presence: true

  def to_s
    prompt.body
  end

  def last_response_by(user)
    responses.where(user_id: user).last
  end

  def concepts_and_characters
    concepts + characters
  end

  def source_id=(id)
    Prompt.find(id).responses << self
  end

  def concept_id=(id)
    Concept.find(id).prompts << self
  end

  def character_id=(id)
    Character.find(id).prompts << self
  end

  def concept_list=(string)
    concept_list = string.scan(/\w+/).map do |name|
      Concept.find_or_create_by(name: name.titleize)
    end
    self.concepts += concept_list
  end

  def character_list=(string)
    character_list = string.split(/,/).map do |name|
      name = name.strip.titleize
      Character.find_or_create_by(name: name)
    end
    self.characters += character_list
  end
end
