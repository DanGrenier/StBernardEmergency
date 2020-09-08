class Patient < ApplicationRecord
	#Has an admission record
	has_one :admission
	
	#Can have more than one alleries (through join table)
	has_many :patient_allergies
	has_many :allergies, through: :patient_allergies
	
	#Can have more than one chronic conditions (through joiing table)
	has_many :patient_chronic_conditions
	has_many :chronic_conditions, through: :patient_chronic_conditions, source: :diagnosis
	
	#Can have more than one medication record
	#Original table name MedicationOrder
	has_many :medications , foreign_key: "patient_id", class_name: "MedicationOrder"
	
	#Can have more than one diagnostic procedure
	has_many :diagnostic_procedures
	
	#Can have more than one final diagnosis through a joining tbale
	has_many :patient_diagnoses
	has_many :diagnoses, through: :patient_diagnoses
	
	#Can have more than one treatment
	has_many :treatments

	#Possible values for gender
	enum gender: [:male, :female, :other]

	#Make sure user enters names,, medical record number
	#gender and date of birth
	validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mr, presence: true
  validates :dob, presence: true
  validates :gender, presence: true

  #Assuming unique medical record numbers assigned to patients
  validates :mr, uniqueness: { message: :already_exists}

  

end