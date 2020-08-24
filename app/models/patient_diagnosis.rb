class PatientDiagnosis < ApplicationRecord
	belongs_to :diagnosis 
	belongs_to :patient
end