class Character < ActiveRecord::Base
  has_many :relationships
  has_many :prompts, through: :relationships
end
