class Treatment < ApplicationRecord
	belongs_to :patient

	def description_necessity
		"#{self.description} to #{self.necessity}"
	end
end