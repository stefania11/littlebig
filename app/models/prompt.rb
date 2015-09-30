class Prompt < ActiveRecord::Base
  has_many :conversations
  has_many :responses, through: :conversations, class_name: "Prompt"

  def prompt_id=(id)
    Prompt.find(id).responses << self
    # self.response_ids << id

  end

end
