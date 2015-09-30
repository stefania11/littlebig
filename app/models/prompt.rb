class Prompt < ActiveRecord::Base
  has_many :conversations
  has_many :responses, through: :conversations, class_name: "Prompt"

  def prompt_id=(id)
    Prompt.find(id).responses << self
  end

  def source
    source_id = Conversation.find_by(response_id: self.id).prompt_id
    Prompt.find(source_id)
  end

end
