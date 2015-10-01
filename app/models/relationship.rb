class Relationship < ActiveRecord::Base
  belongs_to :character
  belongs_to :prompt
end
