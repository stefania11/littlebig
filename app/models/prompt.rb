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

  validates :body, presence: true, length: {
    minimum: 100,
    maximum: 400,
    tokenizer: lambda { |str| str.split(/\s+/) },
    too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"
  }


  def to_s
    prompt.body
  end

  def last_response_by(user)
    responses.where(user_id: user).last
  end

  def concepts_and_characters
    case
    when concepts.present? && characters.present?
      concepts + characters
    when concepts.present?
      concepts
    when characters.present?
      characters
    else
      []
    end
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
      name = name.downcase.titleize

      Concept.find_or_create_by(name: name)
    end

    self.concepts += concept_list
  end

  def character_list=(string)
    # TODO: make this more robust, possibly a class?
    character_list = string.split(/\,/).map do |name|
      name = name.strip.downcase.titleize

      Character.find_or_create_by(name: name)
    end

    self.characters += character_list
  end
end
