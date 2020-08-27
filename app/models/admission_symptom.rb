class AdmissionSymptom < ApplicationRecord
	#Joining table to link Symptoms to an Admission
	belongs_to :admission 
	belongs_to :symptom
end