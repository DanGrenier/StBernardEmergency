require 'rails_helper'

RSpec.describe MedicationOrder, type: :model do 
	describe "Testing MedicationOrder" do
	
	  #Create a patient
		let!(:patient1)  {create :male_patient, dob: (Date.today-40.year)}
	
  	describe "Test Model validations" do 
	  	#Testing validity of the factory
	  	it "has a valid factory" do 
	    	expect(build(:medication_order)).to be_valid
    	end

    	it "is invalid without a patient" do  
      	expect(build(:medication_order, patient: nil )).not_to be_valid
    	end

    	it "is invalid without a name" do 
      	expect(build(:medication_order, name: nil)).not_to be_valid
    	end

    	it "is invalid without a unit" do 
      	expect(build(:medication_order, unit: nil)).not_to be_valid
    	end

     	it "is invalid without a route" do 
      	expect(build(:medication_order, route: nil)).not_to be_valid
	    end
	  end
  	
  
  	describe "Testing methods" do 
	  	# create a few medication orders and their frequency
	  	let!(:p1_aleve) {create :medication_order, patient: patient1, name: "Naproxen Sodium", dosage: 500, necessity: "reduce inflammation", route: :po }
			let!(:p1_aleve_freq) {create :order_frequency, medication_order: p1_aleve, value: "8"}	
			let!(:p1_advil) {create :medication_order, patient: patient1, name: "Ibuprofen", dosage: 200, necessity: "manage pain", route: :im }
			let!(:p1_advil_freq) {create :order_frequency, medication_order: p1_advil, value: "6"}
	  	let!(:p1_tylenol) {create :medication_order, patient: patient1, name: "Acetaminophen", dosage: 200, necessity: "manage pain", route: :sc }
			let!(:p1_tylenol_freq) {create :order_frequency, medication_order: p1_tylenol, value: "4"}
		 	
    	describe "#description_and_dosage" do 
		    it "should return the proper description and dosage formatted properly" do 
		      expect(p1_aleve.description_and_dosage).to eq("#{p1_aleve.name} #{p1_aleve.dosage}mg PO #{p1_aleve_freq.value} hour to #{p1_aleve.necessity}")
		      expect(p1_advil.description_and_dosage).to eq("#{p1_advil.name} #{p1_advil.dosage}mg IM #{p1_advil_freq.value} hour to #{p1_advil.necessity}")
		      expect(p1_tylenol.description_and_dosage).to eq("#{p1_tylenol.name} #{p1_tylenol.dosage}mg SC #{p1_tylenol_freq.value} hour to #{p1_tylenol.necessity}")
	 	    end
		  end
		end
	end
end