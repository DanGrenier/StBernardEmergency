require 'rails_helper'

RSpec.describe Patient, type: :model do 
  let!(:patient1)  {create :patient}
  
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

 

end