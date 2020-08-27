require 'rails_helper'

RSpec.describe Admission, type: :model do 
	describe "Testing Admission" do
		include_context "shared_factories"  

  
  describe "Test Model validations" do 
	  #Testing validity of the factory
	  it "has a valid factory" do 
	    expect(build(:admission)).to be_valid
    end

    it "is invalid without a patient" do  
      expect(build(:admission, patient: nil )).not_to be_valid
    end

    it "is invalid without a moment (datetime)" do 
      expect(build(:admission, moment: nil)).not_to be_valid
    end

  end
	
	
  
  describe "Testing methods" do 
	  # Create patients with 3, 2 and 1 of each
  	# symptoms, diagnoses, allergies, chronic conditions
  	# medications, diagnostic procedures and treatments  	
	

      describe ".current (scope)" do 
      	it "should return the proper current (today) list of patients" do
      		pp DateTime.now
      	  expect(Admission.current(Date.current)).to contain_exactly(admission1, admission2, admission3)
        end

        it "should return the proper list of patients based on any" do
      	  expect(Admission.current(Date.current-1.day)).to contain_exactly(admission4)
        end
      end

		  describe "#patient_name" do 
	      it "should return the proper name" do 
	        expect(admission1.patient_name).to eq("#{admission1.patient.last_name}, #{admission1.patient.first_name}")
	        expect(admission2.patient_name).to eq("#{admission2.patient.last_name}, #{admission2.patient.first_name}")
	        expect(admission3.patient_name).to eq("#{admission3.patient.last_name}, #{admission3.patient.first_name}")
	        expect(admission4.patient_name).to eq("#{admission4.patient.last_name}, #{admission4.patient.first_name}")
	      end
	    end

	    describe "#diagnoses_list" do 
	    	it "should return all admission diagnoses (if any) formatted" do 
	    		expect(admission1.diagnoses_list).to eq("#{p1_init_diag1.diagnosis.description_and_code}, #{p1_init_diag2.diagnosis.description_and_code}, and #{p1_init_diag3.diagnosis.description_and_code}")
	    		expect(admission2.diagnoses_list).to eq("#{p2_init_diag1.diagnosis.description_and_code} and #{p2_init_diag2.diagnosis.description_and_code}")
	    		expect(admission3.diagnoses_list).to eq("#{p3_init_diag1.diagnosis.description_and_code}")
	    		expect(admission4.diagnoses_list).to eq("#{p4_init_diag1.diagnosis.description_and_code}")
	    	end
		  end

		  describe "#symptoms_list" do 
		  	it "should return all symptoms (if any) properly formatted" do 
		  		expect(admission1.symptoms_list).to eq("#{p1_sym1.symptom.description}, #{p1_sym2.symptom.description}, and #{p1_sym3.symptom.description}")
		  		expect(admission2.symptoms_list).to eq("#{p2_sym1.symptom.description} and #{p2_sym2.symptom.description}")
		  		expect(admission3.symptoms_list).to eq("#{p3_sym1.symptom.description}")
		  		expect(admission4.symptoms_list).to eq("")
		  	end
		  end

		  describe "#observations_list" do 
		  	it "should return all observations (if any) properly formatted" do 
		  		expect(admission1.observations_list).to eq(("#{p1_ob1.description}, #{p1_ob2.description}, and #{p1_ob3.description}.").capitalize)
		  		expect(admission2.observations_list).to eq(("#{p2_ob1.description} and #{p2_ob2.description}.").capitalize )
		  		expect(admission3.observations_list).to eq(("#{p3_ob1.description}.").capitalize )
		  		expect(admission4.observations_list).to eq("")
		  	end
		  end
		end
	end
end