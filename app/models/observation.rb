class Observation < ApplicationRecord
	#Observations are part of the admission process
	belongs_to  :admission
	#Make sure the user enters a timestamp and description
	validates :moment, presence: true
	validates :description, presence: true

end