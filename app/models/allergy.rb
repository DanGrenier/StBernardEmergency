class Allergy < ApplicationRecord
	has_many :patients, through: :patient_allergies 
end