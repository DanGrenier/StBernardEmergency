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


  #Method that calculates patient's age based on dob
	def age
	  (Time.now.to_s(:number).to_i - dob.to_time.to_s(:number).to_i)/10e9.to_i
	end
  
  #Method that gets and format patient allergies list 
  #In human readable format
	def allergies_list
		self.allergies.any? ? self.allergies.map{|allergy| allergy.description}.to_sentence : I18n.t('no_allergies')
	end

  #Method that gets and format patient's chronic conditions
  #In human readable format
	def chronic_conditions_list
		self.chronic_conditions.any? ? self.chronic_conditions.map {|condition| condition.description}.to_sentence : I18n.t('no_chronic_conditions')
	end

	#Method that gets and format patient's medications
  #In human readable format 
	def medications_list
		self.medications.any? ? self.medications.map{|med| med.description_and_dosage}.to_sentence : ""
	end

	#Method that gets and format patient's diagnostic procedures
  #In human readable format
	def diagnostic_procedures_list
		self.diagnostic_procedures.any?  ? self.diagnostic_procedures.map{|diag_proc| diag_proc.description_and_time }.to_sentence : ""
	end

	#Method that gets and format patient's final diagnoses
  #In human readable format
	def diagnoses_list
		self.diagnoses.any? ? self.diagnoses.map{|diagnosis| diagnosis.description_and_code}.to_sentence : ""
	end

	#Method that gets and format patient's treatments
  #In human readable format
	def treatments_list
		self.treatments.any? ? self.treatments.map{|treatment| treatment.description_necessity}.to_sentence : ""
	end


end