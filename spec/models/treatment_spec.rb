require 'rails_helper'

RSpec.describe Treatment, type: :model do 
	describe "Testing Treatment" do
	#Create a patient
	let!(:patient1)  {create :male_patient, dob: (Date.today-40.year)}
	
  describe "Test Model validations" do 
	  #Testing validity of the factory
	  it "has a valid factory" do 
	    expect(build(:treatment)).to be_valid
    end

    it "is invalid without a patient" do  
      expect(build(:treatment, patient: nil )).not_to be_valid
    end

    it "is invalid without a necessity" do 
      expect(build(:treatment, necessity: nil)).not_to be_valid
    end

    it "is invalid without a description" do 
      expect(build(:treatment, description: nil)).not_to be_valid
    end

  end
  	
  
  describe "Testing methods" do 
	  # create a few treatments
	  let!(:p1_resetting) {create :treatment, patient: patient1, description: "resetting the bone in place", necessity: "allow it to heal in its proper place"}
		let!(:p1_brace) {create :treatment, patient: patient1, description: "immobilizing the bone in a brace", necessity: "reduce pain and discomfort"}
		let!(:p1_ice) {create :treatment, patient: patient1, description: "applied ice", necessity: "reduce swelling"}
			
    

		  describe "#description_necessity" do 
	      it "should return the proper description and necessity formatted properly" do 
	        expect(p1_resetting.description_necessity).to eq("#{p1_resetting.description} to #{p1_resetting.necessity}")
	        expect(p1_brace.description_necessity).to eq("#{p1_brace.description} to #{p1_brace.necessity}")
	        expect(p1_ice.description_necessity).to eq("#{p1_ice.description} to #{p1_ice.necessity}")
 	      end
	    end

		end
	end
end