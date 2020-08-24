class MedicationOrder < ApplicationRecord
	belongs_to :patient
	has_one :order_frequency
  enum unit: [:mg]
  enum route: [:po, :im, :sc]

  def description_and_dosage
  	"#{self.name} #{self.dosage}#{self.unit} #{self.route.upcase} #{self.order_frequency.value} #{self.order_frequency.unit} to #{self.necessity}"
  end

end