FactoryBot.define do
  factory :observation do 
    admission
    description {""}
    moment {DateTime.now}
  end

end