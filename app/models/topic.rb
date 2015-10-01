class Topic < ActiveRecord::Base
  belongs_to :prompt
  belongs_to :concept
end
