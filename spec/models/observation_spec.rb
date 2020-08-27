require 'rails_helper'

RSpec.describe Treatment, type: :model do 
	describe "Testing Treatment" do
		
	  describe "Test Model validations" do 
		  #Testing validity of the factory
		  it "has a valid factory" do 
		    expect(build(:observation)).to be_valid
	    end

	    it "is invalid without an admission/patient" do  
	      expect(build(:observation, admission: nil )).not_to be_valid
	    end

	    it "is invalid without a timestamp" do 
	      expect(build(:observation, moment: nil)).not_to be_valid
	    end

	    it "is invalid without a description" do 
	      expect(build(:observation, description: nil)).not_to be_valid
	    end

	  end
	end
end