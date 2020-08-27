require 'rails_helper'

RSpec.describe DiagnosticProcedure, type: :model do 
	describe "Testing Diagnostic Procedure" do
	
		#Create a patient
		let!(:patient1)  {create :male_patient, dob: (Date.today-40.year)}
		
	  describe "Test Model validations" do 
		  #Testing validity of the factory
		  it "has a valid factory" do 
		    expect(build(:diagnostic_procedure)).to be_valid
	    end

	    it "is invalid without a patient" do  
	      expect(build(:diagnostic_procedure, patient: nil )).not_to be_valid
	    end

	    it "is invalid without a moment (datetime)" do 
	      expect(build(:diagnostic_procedure, moment: nil)).not_to be_valid
	    end

	    it "is invalid without a description" do 
	      expect(build(:diagnostic_procedure, description: nil)).not_to be_valid
	    end

	  end
	  
	  describe "Testing methods" do 
		  # create a few diagnostic procedures
		  let!(:p1_xray) {create :diagnostic_procedure, patient: patient1, description: "x-ray of knee"}
			let!(:p1_mri) {create :diagnostic_procedure, patient: patient1, description: "mri of knee"}
			let!(:p1_ct_scan) {create :diagnostic_procedure, patient: patient1, description: "ct-scan of head"}

			describe "#description_and_time" do 
		    it "should return the proper description and time formatted properly" do 
		      expect(p1_xray.description_and_time).to eq("#{p1_xray.description} on #{I18n.l(p1_xray.moment, format: :date_long)} at #{I18n.l(p1_xray.moment, format: :time_only )}")
		      expect(p1_mri.description_and_time).to eq("#{p1_mri.description} on #{I18n.l(p1_mri.moment, format: :date_long)} at #{I18n.l(p1_mri.moment, format: :time_only )}")
		      expect(p1_ct_scan.description_and_time).to eq("#{p1_ct_scan.description} on #{I18n.l(p1_ct_scan.moment, format: :date_long)} at #{I18n.l(p1_ct_scan.moment, format: :time_only )}")
	 	    end
		  end
		end
	end
end