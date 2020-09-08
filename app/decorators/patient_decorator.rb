class PatientDecorator < BaseDecorator

	#Method that calculates patient's age based on dob
	def age
	  (Time.now.to_s(:number).to_i - dob.to_time.to_s(:number).to_i)/10e9.to_i 
	end
  #Method that gets and format patient allergies list 
  #In human readable format
	def allergies_list
		allergies.any? ? allergies.map{|allergy| allergy.description}.to_sentence : I18n.t('no_allergies')
	end

  #Method that gets and format patient's chronic conditions
  #In human readable format
	def chronic_conditions_list
		chronic_conditions.any? ? chronic_conditions.map {|condition| condition.description}.to_sentence : I18n.t('no_chronic_conditions')
	end

	#Method that gets and format patient's medications
  #In human readable format 
	def medications_list
		medications.any? ? medications.map{|med| med.description_and_dosage}.to_sentence : ""
	end

	#Method that gets and format patient's diagnostic procedures
  #In human readable format
	def diagnostic_procedures_list
		diagnostic_procedures.any?  ? diagnostic_procedures.map{|diag_proc| diag_proc.description_and_time }.to_sentence : ""
	end

	#Method that gets and format patient's final diagnoses
  #In human readable format
	def diagnoses_list
		diagnoses.any? ? diagnoses.map{|diagnosis| diagnosis.description_and_code}.to_sentence : ""
	end

	#Method that gets and format patient's treatments
  #In human readable format
	def treatments_list
		treatments.any? ? treatments.map{|treatment| treatment.description_necessity}.to_sentence : ""
	end
  

end