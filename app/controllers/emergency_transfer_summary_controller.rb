class EmergencyTransferSummaryController < ApplicationController

	def index
		@patients = Admission.current(Date.today)
	end


	def show
		@patient = Patient.find(params[:id])
	end
end
