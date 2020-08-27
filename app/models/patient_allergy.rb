class PatientAllergy < ApplicationRecord
	#Joining table to link allergies to a patient
	belongs_to :patient 
	belongs_to :allergy
end