class PatientChronicCondition < ApplicationRecord
	#Joining table to link chronic condition to a patient
	belongs_to :patient 
	belongs_to :diagnosis
end