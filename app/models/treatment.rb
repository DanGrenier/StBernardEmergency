class Treatment < ApplicationRecord
	belongs_to :patient
	#Make sure user enters description and necessity
	validates :description, presence: true
	validates :necessity, presence: true

	#Method that formats one treatment record
	#For human reading
	def description_necessity
		"#{self.description} to #{self.necessity}"
	end
end