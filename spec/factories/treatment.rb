FactoryBot.define do
  factory :treatment do 
    patient
    description {"Some treatment"}
    necessity {"Because of a reason"}
  end

end