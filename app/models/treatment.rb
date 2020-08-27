class Treatment < ApplicationRecord
	belongs_to :patient

	validates :description, presence: true
	validates :necessity, presence: true

	def description_necessity
		"#{self.description} to #{self.necessity}"
	end
end