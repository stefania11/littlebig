class Concept < ActiveRecord::Base
  has_many :topics
  has_many :prompts, through: :topics
end
