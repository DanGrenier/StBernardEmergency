class MedicationOrder < ApplicationRecord
	belongs_to :patient
  #Joins into order frequency 
	has_one :order_frequency
  #Possible values for units
  enum unit: [:mg]
  #Possible values for routes
  enum route: [:po, :im, :sc]

  #Make sure user enters medication name, unit, dosage, route
  validates :name, presence: true
	validates :unit, presence: true
	validates :dosage, presence: true
	validates :route, presence: true

  #Method that formats one medication entry with proper
  #dosage, name, unit and route for human reading 
  def description_and_dosage
  	"#{self.name} #{self.dosage}#{MedicationOrder.human_enum_name(:units, self.unit)} #{MedicationOrder.human_enum_name(:routes, self.route)} #{self.order_frequency.value} #{OrderFrequency.human_enum_name(:units,self.order_frequency.unit)} to #{self.necessity}"
  end

end