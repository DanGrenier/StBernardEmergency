class Diagnosis < ApplicationRecord
	has_many :patient_diagnoses
	has_many :patients, through: :patient_diagnoses
	has_many :admission_diagnoses
	has_many :admissions, through: :admission_diagnoses
	has_many :patient_chronic_conditions
	has_many :patients, through: :patient_chronic_conditions


	 def description_and_code
  	"#{self.description} (#{self.code})"
   end
end