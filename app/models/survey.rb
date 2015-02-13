class Survey < ActiveRecord::Base
  has_many :questions
  has_many :possible_choices
  belongs_to :user
end
