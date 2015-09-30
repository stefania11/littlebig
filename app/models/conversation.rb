class Conversation < ActiveRecord::Base
  belongs_to :prompt
  belongs_to :response, class_name: "Prompt"
end
