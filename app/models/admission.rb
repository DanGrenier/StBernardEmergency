class Admission < ApplicationRecord
	belongs_to :patient
	has_many :admission_diagnoses
	has_many :admission_symptoms
	has_many :diagnoses , through: :admission_diagnoses
	has_many :symptoms, through: :admission_symptoms
	has_many :observations

	scope :current, -> (target_date) { joins(:patient).select("patients.last_name as last_name, patients.first_name as first_name, patients.id as id").where('DATE(admissions.moment) = ?',target_date)}


	def diagnoses_list
		self.diagnoses.map{|d| d.description_and_code}.to_sentence
	end

	def symptoms_list
		self.symptoms.map{|s| s.description.downcase}.to_sentence(locale: I18n.locale)
	end

	def observations_list
		self.observations.map{|o| o.description}.to_sentence(locale: I18n.locale)
	end
	
	def date 
		I18n.l(self.moment, format: :date_long)
	end

	def time
		I18n.l(self.moment, format: :time_only)
	end
end