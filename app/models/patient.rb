class Patient < ApplicationRecord
	has_one :admission
	has_many :patient_allergies
	has_many :allergies, through: :patient_allergies
	has_many :patient_chronic_conditions
	has_many :chronic_conditions, through: :patient_chronic_conditions, source: :diagnosis
	has_many :medications , foreign_key: "patient_id", class_name: "MedicationOrder"
	has_many :diagnostic_procedures
	has_many :patient_diagnoses
	has_many :diagnoses, through: :patient_diagnoses
	has_many :treatments

	enum gender: [:male, :female, :other]


	def age
	  (Time.now.to_s(:number).to_i - dob.to_time.to_s(:number).to_i)/10e9.to_i
	end

	def allergies_list
		self.allergies.any? ? self.allergies.map{|allergy| allergy.description}.to_sentence : "No allergies"
	end

	def chronic_conditions_list
		self.chronic_conditions.any? ? self.chronic_conditions.map {|condition| condition.description}.to_sentence : "No chronic conditions"
	end

	def medications_list
		self.medications.any? ? self.medications.map{|med| med.description_and_dosage}.to_sentence : ""
	end

	def diagnostic_procedures_list
		self.diagnostic_procedures.any?  ? self.diagnostic_procedures.map{|diag_proc| diag_proc.description_and_time }.to_sentence : ""
	end

	def diagnoses_list
		self.diagnoses.any? ? self.diagnoses.map{|diagnosis| diagnosis.description_and_code}.to_sentence : ""
	end

	def treatments_list
		self.treatments.any? ? self.treatments.map{|treatment| treatment.description_necessity}.to_sentence : ""
	end


end