class MedicationOrder < ApplicationRecord
	belongs_to :patient
	has_one :order_frequency
  enum unit: [:mg]
  enum route: [:po, :im, :sc]

  def description_and_dosage
  	"#{self.name} #{self.dosage}#{MedicationOrder.human_enum_name(:units, self.unit)} #{MedicationOrder.human_enum_name(:routes, self.route)} #{self.order_frequency.value} #{OrderFrequency.human_enum_name(:units,self.order_frequency.unit)} to #{self.necessity}"
  end

end