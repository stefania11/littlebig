class Prompt < ActiveRecord::Base
  has_many :conversations
  has_many :responses, through: :conversations, class_name: "Prompt"
end
