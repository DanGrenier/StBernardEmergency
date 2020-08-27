require 'faker'

FactoryBot.define do 
	sequence :medical_record do |n|
		"%05d" % n
	end
end

FactoryBot.define do
	factory :patient, class: Patient do 
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    middle_name {Faker::Name.first_name}
    mr {generate(:medical_record)}
    dob {(DateTime.now-40.year)}
    gender {:male}
  end

  factory :male_patient, class: Patient do 
    first_name {Faker::Name.male_first_name}
    last_name {Faker::Name.last_name}
    middle_name {Faker::Name.male_first_name}
    mr {generate(:medical_record)}
    dob {(DateTime.now-40.year)}
    gender {:male}
  end

  factory :female_patient, class: Patient do 
    first_name {Faker::Name.female_first_name}
    last_name {Faker::Name.last_name}
    middle_name {Faker::Name.female_first_name}
    mr {generate(:medical_record)}
    dob {(DateTime.now-40.year)}
    gender {:male}
  end

end