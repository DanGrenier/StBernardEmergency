class OrderFrequency < ApplicationRecord
  belongs_to :medication_order
  #List of possible values for unit
  enum unit: [:hour]

  #Make sure user enters a value for the unit
  validates :value, presence: true
  validates :unit, presence: true
end