FactoryBot.define do
  factory :admission do 
    patient
    moment {DateTime.current}
  end

end