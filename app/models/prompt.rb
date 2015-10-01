class Prompt < ActiveRecord::Base
  belongs_to :source, class_name: 'Prompt'
  has_many :responses, class_name: 'Prompt', foreign_key: 'source_id'

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
