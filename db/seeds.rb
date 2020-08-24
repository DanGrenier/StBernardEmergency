# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Facility.create({name: "Blue Alps Ski Camp"})


#Create the static values
sym = %w[Dizziness Vertigo Sharp\ Pain Fever Chills Fatigue Body\ aches Headache Nausea Vomiting Shortness\ of\ breath Difficulty\ breathing Bleeding Gastric\ pain Swelling]

sym.each do |s|
	Symptom.create({description: s})
end

Diagnosis.create({coding_system: "ICD-10-CM", code: "S82.001", description: "Fracture of patella"})
Diagnosis.create({coding_system: "ICD-10-CM", code: "S82.101", description: "Fracture of upper end of tibia"})
Diagnosis.create({coding_system: "ICD-10-CM", code: "S82.201", description: "Fracture of shaft of tibia"})
Diagnosis.create({coding_system: "ICD-10-CM", code: "S82.301", description: "Fracture of lower end of tibia"})
Diagnosis.create({coding_system: "ICD-10-CM", code: "S82.401", description: "Fracture of shaft of fibula"})
Diagnosis.create({coding_system: "ICD-10-CM", code: "S82.811", description: "Other fractures of lower leg"})
Diagnosis.create({coding_system: "ICD-10-CM", code: "S83.001", description: "Subluxation and dislocation of patella"})
Diagnosis.create({coding_system: "ICD-10-CM", code: "S83.101", description: "Subluxation and dislocation of knee"})
Diagnosis.create({coding_system: "ICD-10-CM", code: "S83.200", description: "Tear of meniscus, current injury"})
Diagnosis.create({coding_system: "ICD-10-CM", code: "E10.10", description: "Type 1 diabetes mellitus"})

Allergy.create({description: "Tree Nuts"})
Allergy.create({description: "Peanuts"})
Allergy.create({description: "Shellfish"})
Allergy.create({description: "Latex"})
Allergy.create({description: "Dairy"})
Allergy.create({description: "Penicillin"})
Allergy.create({description: "Eggs"})
Allergy.create({description: "Wheat"})
Allergy.create({description: "Soy"})
Allergy.create({description: "Fish"})

if Rails.env.development?
#Create Patient without allergies but with chronic conditions
dan = Patient.create({first_name: "Daniel",
								middle_name: "S",
								last_name: "Grenier",
							  mr: "1000001",
							  dob: DateTime.new(1980,01,01),
							  gender: :male
							})

	admission = dan.create_admission({moment: DateTime.now}) 
	admission.admission_diagnoses.create({admission_id: admission.id, diagnosis_id: Diagnosis.first.id})
	admission.admission_symptoms.create({admission_id: admission.id, symptom_id: Symptom.last.id})
	admission.admission_symptoms.create({admission_id: admission.id, symptom_id: Symptom.first.id})
	admission.observations.create({admission_id: admission.id, moment: DateTime.now, description: "Does not appear to be a compound fracture" })
	dan.patient_chronic_conditions.create({diagnosis_id: Diagnosis.last.id})
  med = dan.medications.create({name: "Ibuprofen", unit: :mg, dosage: 500.00, route: :po, necessity: "To manage pain" })
  med.create_order_frequency({value: "6", unit: :hour})
  
  dan.diagnostic_procedures.create({description: "a radiography", moment: DateTime.now})
  dan.diagnostic_procedures.create({description: "an MRI", moment: DateTime.now})
  dan.patient_diagnoses.create({diagnosis_id: Diagnosis.first.id})
  dan.treatments.create({description: "Immobilized the injured area", necessity: "reduce discomfort and restrict motion"})
  dan.treatments.create({description: "Applied ice to the area", necessity: "reduce swelling"})

#Create patient with allergies but without chronic conditions
jane = Patient.create({first_name: "Jane",
                                middle_name: "M",
                                last_name: "Doe",
                              mr: "1000002",
                              dob: DateTime.new(1986,01,01),
                              gender: :female
                            })

    admission = jane.create_admission({moment: DateTime.now}) 
    admission.admission_diagnoses.create({admission_id: admission.id, diagnosis_id: Diagnosis.first.id})
    admission.admission_diagnoses.create({admission_id: admission.id, diagnosis_id: Diagnosis.second.id})
    admission.admission_symptoms.create({admission_id: admission.id, symptom_id: Symptom.first.id})
    admission.admission_symptoms.create({admission_id: admission.id, symptom_id: Symptom.second.id})
    admission.admission_symptoms.create({admission_id: admission.id, symptom_id: Symptom.third.id})
    admission.admission_symptoms.create({admission_id: admission.id, symptom_id: Symptom.fourth.id})
    jane.patient_allergies.create({allergy_id: Allergy.first.id})
  
  jane.diagnostic_procedures.create({description: "a radiography", moment: DateTime.now})
  jane.patient_diagnoses.create({diagnosis_id: Diagnosis.first.id})
  

#Create a patient with both
end