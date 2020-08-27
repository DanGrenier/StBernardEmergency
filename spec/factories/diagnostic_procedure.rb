FactoryBot.define do
  factory :diagnostic_procedure do 
    patient
    description {"Some procedure"}
    moment {DateTime.now}
  end

end