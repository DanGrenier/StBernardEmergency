class EmergencyTransferSummaryController < ApplicationController

	#Get current patient to show in the transfer patient
	#dropdown. Current patients = today's patients
	def index
		@admissions = Admission.current(Date.today)
		
	end

	#Grab the proper patient to send to the show view
	def show
		patient = Patient.find(params[:id])
		@admission = helpers.decorate(patient.admission)
		@patient = helpers.decorate(patient)
	end
end
