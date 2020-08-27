class Diagnosis < ApplicationRecord
	has_many :patient_diagnoses
	has_many :patients, through: :patient_diagnoses, source: :patient
	
	has_many :admission_diagnoses
	has_many :admissions, through: :admission_diagnoses
	
	has_many :patient_chronic_conditions
	
	#Method that formats the description and code
	#of a diagnosis
	def description_and_code
    "#{self.description} (#{self.code})"
   end
end