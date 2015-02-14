class Vote < ActiveRecord::Base
  belongs_to :possible_choice
end
