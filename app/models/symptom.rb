class Symptom < ApplicationRecord
	has_many :admission_symptoms
	has_many :admissions, through: :admission_symptoms
end