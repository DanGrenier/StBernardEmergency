FactoryBot.define do

  factory :diagnosis do 
    coding_system {"ICD-10-CM"}
    code {"###.###"}
    description {"Some Diagnosis"}
  end

	factory :patella_fracture, class: Diagnosis do 
    coding_system {"ICD-10-CM" }
    code {"S82.001"}
    description {"Fracture of patella"}
  end

  factory :patella_dislocation, class: Diagnosis do 
    coding_system {"ICD-10-CM"}
    code {"S83.001"}
    description {"Subluxation and dislocation of patella"}
  end

  factory :meniscus_tear, class: Diagnosis do 
  	coding_system {"ICD-10-CM"}
  	code {"S83.200"}
  	description {"Tear of meniscus, current injury"}
  end

  factory :upper_tibia_fracture, class: Diagnosis do 
	  coding_system {"ICD-10-CM"}
	  code {"S82.101"} 
	  description {"Fracture of upper end of tibia"}
  end

  factory :tibia_shaft_fracture, class: Diagnosis do 
	  coding_system {"ICD-10-CM"}
	  code {"S82.201"} 
	  description {"Fracture of shaft of tibia"}
  end

  factory :diabetes, class: Diagnosis do 
	  coding_system {"ICD-10-CM"} 
	  code {"E10.10"}
	  description {"Type 1 diabetes mellitus"}
  end

  factory :heart_murmur, class: Diagnosis do 
	  coding_system {"ICD-10-CM"} 
	  code {"R01.1"}
	  description {"cardiac murmur"}
  end

  factory :high_bp, class: Diagnosis do 
	  coding_system {"ICD-10-CM"} 
	  code {"R03.0"}
	  description {"elevated blood pressure"}
  end

end