class AdmissionDecorator < BaseDecorator

  #Getting and formatting the list of initial diagnoses
  #For the patient related to ths admission
	def diagnoses_list
		diagnoses.map{|d| d.description_and_code}.to_sentence
	end
  
  #Getting and formatting the symptoms list 
  #For the patient related to ths admission
	def symptoms_list
		symptoms.any? ? symptoms.map{|s| s.description.downcase}.to_sentence(locale: I18n.locale) : ""
	end

	#Getting and formatting the observations
  #For the patient related to ths admission
	def observations_list
		observations.any? ? (observations.map{|o| o.description}.to_sentence(locale: I18n.locale)).capitalize+"." : ""
	end

	#Method that extracts the date from timestamp of admission
	def date 
		I18n.l(moment, format: :date_long)
	end
  
  #Method that extracts the time from timestamp of admission
	def time
		I18n.l(moment, format: :time_only)
	end


end