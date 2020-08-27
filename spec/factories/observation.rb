FactoryBot.define do
  factory :observation do 
    admission
    description {"Observation"}
    moment {DateTime.current}
  end

end