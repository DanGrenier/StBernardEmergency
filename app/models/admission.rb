class Admission < ApplicationRecord

	belongs_to :patient
	#Diagnoses association
	has_many :admission_diagnoses
	has_many :diagnoses , through: :admission_diagnoses
	#Symptoms association
	has_many :admission_symptoms
	has_many :symptoms, through: :admission_symptoms

	#Observations
	has_many :observations

	#Make sure the timestamp is entered
  validates :moment, presence: true

  #Scope used to retrieve current patients
  #based on today's date. Scope could be widen
  #But unlikely to have patients overnight
	scope :current, -> (target_date) {where('DATE(admissions.moment) = ?',target_date)}

	#Method used to show the patient name in the
	#Select box to transfer
	def patient_name
		"#{self.patient.last_name}, #{self.patient.first_name}"
	end

end