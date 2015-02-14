class PossibleChoice < ActiveRecord::Base
  belongs_to :question
  belongs_to :survey
  has_many :votes
end
