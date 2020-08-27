FactoryBot.define do
  factory :admission do 
    patient
    moment {DateTime.now}
  end

end