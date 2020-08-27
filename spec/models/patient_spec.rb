require 'rails_helper'

RSpec.describe Patient, type: :model do 
	describe "Testing Patient" do
	  #Include our shared factories	
	  include_context "shared_factories"  
	 
    describe "Test Model validations" do 
	  	#Testing validity of the factory
	  	it "has a valid factory" do 
	    	expect(build(:patient)).to be_valid
    	end

    	#Test validation of missing values that dont allow null
	  	it "is invalid without first name" do 
  	  	expect(build(:patient, first_name: nil )).not_to be_valid
  		end

	  	it "is invalid without last name" do 
	    	expect(build(:patient, last_name: nil )).not_to be_valid
	  	end
	 
	  	it "is invalid without medical record" do  
	    	expect(build(:patient, mr: nil )).not_to be_valid
	  	end

	  	it "is invalid without date of birth" do  
	    	expect(build(:patient, dob: nil )).not_to be_valid
	  	end

    	it "is invalid without gender" do  
	     	expect(build(:patient, gender: nil )).not_to be_valid
  	  end

    	it "does not accept duplicate medical record" do 
      	expect(build(:patient, mr: patient1.mr)).not_to be_valid
    	end
  	end
  
  
  	describe "Test the methods" do 
  	
		 	describe "#age" do 
	      it "should return the proper age" do 
	        expect(patient1.age).to eq(40)
	        expect(patient2.age).to eq(30)
	        expect(patient3.age).to eq(20)
	        expect(patient4.age).to eq(10)
	      end
	    end

	    describe "#allergies_list" do 
	    	it "should return all allergies (if any) formatted" do 
	    		expect(patient1.allergies_list).to eq("#{nuts.description}, #{latex.description}, and #{shellfish.description}")
	    		expect(patient2.allergies_list).to eq("#{nuts.description} and #{latex.description}")
	    		expect(patient3.allergies_list).to eq("#{nuts.description}")
	    		expect(patient4.allergies_list).to eq("no allergies")
	    	end
		  end

		  describe "#chronic_conditions_list" do 
		  	it "should return all chronic conditions (if any) properly formatted" do
		  		expect(patient1.chronic_conditions_list).to eq("#{high_bp.description}, #{diabetes.description}, and #{heart_murmur.description}")
		  		expect(patient2.chronic_conditions_list).to eq("#{high_bp.description} and #{diabetes.description}")
		  		expect(patient3.chronic_conditions_list).to eq("#{high_bp.description}")
		  		expect(patient4.chronic_conditions_list).to eq("no chronic conditions")
		  	end
		  end

		  describe "#diagnostic_procedures_list" do 
		  	it "should return all diagnostic procedures (if any) properly formatted" do 
		  		expect(patient1.diagnostic_procedures_list).to eq("#{p1_xray.description} on #{I18n.l(p1_xray.moment, format: :date_long)} at #{I18n.l(p1_xray.moment, format: :time_only)}, #{p1_mri.description} on #{I18n.l(p1_mri.moment, format: :date_long)} at #{I18n.l(p1_mri.moment, format: :time_only)}, and #{p1_ct_scan.description} on #{I18n.l(p1_ct_scan.moment, format: :date_long)} at #{I18n.l(p1_ct_scan.moment, format: :time_only)}")
		  		expect(patient2.diagnostic_procedures_list).to eq("#{p2_xray.description} on #{I18n.l(p2_xray.moment, format: :date_long)} at #{I18n.l(p2_xray.moment, format: :time_only)} and #{p2_mri.description} on #{I18n.l(p2_mri.moment, format: :date_long)} at #{I18n.l(p2_mri.moment, format: :time_only)}")
		  		expect(patient3.diagnostic_procedures_list).to eq("#{p3_xray.description} on #{I18n.l(p3_xray.moment, format: :date_long)} at #{I18n.l(p3_xray.moment, format: :time_only)}")
		  	end
		  end

		  describe "#medications_list" do 
		  	it "should return all medications (if any) properly formatted" do
		  		expect(patient1.medications_list).to eq("#{p1_aleve.name} #{p1_aleve.dosage}mg PO #{p1_aleve_freq.value} hour to #{p1_aleve.necessity}, #{p1_advil.name} #{p1_advil.dosage}mg IM #{p1_advil_freq.value} hour to #{p1_advil.necessity}, and #{p1_tylenol.name} #{p1_tylenol.dosage}mg SC #{p1_tylenol_freq.value} hour to #{p1_tylenol.necessity}")
		  		expect(patient2.medications_list).to eq("#{p2_aleve.name} #{p2_aleve.dosage}mg PO #{p2_aleve_freq.value} hour to #{p2_aleve.necessity} and #{p2_advil.name} #{p2_advil.dosage}mg IM #{p2_advil_freq.value} hour to #{p2_advil.necessity}")
		  		expect(patient3.medications_list).to eq("#{p3_aleve.name} #{p3_aleve.dosage}mg PO #{p3_aleve_freq.value} hour to #{p3_aleve.necessity}")
  	  		expect(patient4.medications_list).to eq("")
		  	end
	    end

	    describe "#treatments_list" do 
	    	it "should return all treatments (if any) properly formatted" do 
	    		expect(patient1.treatments_list).to eq("#{p1_resetting.description} to #{p1_resetting.necessity}, #{p1_brace.description} to #{p1_brace.necessity}, and #{p1_ice.description} to #{p1_ice.necessity}")
	    		expect(patient2.treatments_list).to eq("#{p2_resetting.description} to #{p2_resetting.necessity} and #{p2_brace.description} to #{p2_brace.necessity}")
	    		expect(patient3.treatments_list).to eq("#{p2_resetting.description} to #{p2_resetting.necessity}")
	    		expect(patient4.treatments_list).to eq("")
	    	end
	    end

	    describe "#diagnoses_list" do
	    	it "should return all (final) diagnoses (if any) properly formatted" do 
	    		expect(patient1.diagnoses_list).to eq("#{p1_diag1.diagnosis.description} (#{p1_diag1.diagnosis.code}), #{p1_diag2.diagnosis.description} (#{p1_diag2.diagnosis.code}), and #{p1_diag3.diagnosis.description} (#{p1_diag3.diagnosis.code})")
	    		expect(patient2.diagnoses_list).to eq("#{p2_diag1.diagnosis.description} (#{p2_diag1.diagnosis.code}) and #{p2_diag2.diagnosis.description} (#{p2_diag2.diagnosis.code})")
	    		expect(patient3.diagnoses_list).to eq("#{p3_diag1.diagnosis.description} (#{p3_diag1.diagnosis.code})")
	    		expect(patient4.diagnoses_list).to eq("#{p4_diag1.diagnosis.description} (#{p4_diag1.diagnosis.code})")
	    	end
	    end
		end
	end
end