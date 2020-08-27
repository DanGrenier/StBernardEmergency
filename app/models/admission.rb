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

  #Getting and formatting the list of initial diagnoses
  #For the patient related to ths admission
	def diagnoses_list
		self.diagnoses.map{|d| d.description_and_code}.to_sentence
	end
  
  #Getting and formatting the symptoms list 
  #For the patient related to ths admission
	def symptoms_list
		self.symptoms.any? ? self.symptoms.map{|s| s.description.downcase}.to_sentence(locale: I18n.locale) : ""
	end

  #Getting and formatting the observations
  #For the patient related to ths admission
	def observations_list
		self.observations.any? ? (self.observations.map{|o| o.description}.to_sentence(locale: I18n.locale)).capitalize+"." : ""
	end
	
	#Method that extracts the date from timestamp of admission
	def date 
		I18n.l(self.moment, format: :date_long)
	end

	#Method that extracts the time from timestamp of admission
	def time
		I18n.l(self.moment, format: :time_only)
	end
end