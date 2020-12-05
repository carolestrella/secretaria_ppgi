class Requirement < ApplicationRecord
  validates_length_of :requirements, :minimum => 1
end
