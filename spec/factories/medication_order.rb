FactoryBot.define do
  factory :medication_order do 
  	patient
    name {"medication name"}
    unit {:mg}
    dosage {200}
    route {:po}
    necessity {"because of something"}
   
  end


end