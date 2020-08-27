class PatientDiagnosis < ApplicationRecord
	#Joining table to link final diagnoses to a patient
	belongs_to :diagnosis 
	belongs_to :patient
end