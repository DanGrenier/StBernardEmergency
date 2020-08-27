class AdmissionDiagnosis < ApplicationRecord
	#Joining table to link Diagnoses to an Admission
  belongs_to :admission 
  belongs_to :diagnosis	
end