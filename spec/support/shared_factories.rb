require 'rails_helper'

#Shared context containing all the code
#To create factories for 4 different patients
#All of them with different numbers of
#symptoms, diagnoses, allergies, chronic conditions
#treatments, medications and diagnostic procedures
#in order to properly test the human readable text

shared_context "shared_factories" do
	let!(:facility)  {create :facility}
  let!(:patient1)  {create :male_patient, dob: (Date.today-40.year)}
  let!(:patient2)  {create :female_patient, dob: (Date.today-30.year)}
 	let!(:patient3)  {create :male_patient, dob: (Date.today-20.year)}
	let!(:patient4)  {create :female_patient, dob: (Date.today-10.year)}

  #create a few symptoms
  let!(:dizziness) {create :symptom, description: "dizziness"}
	let!(:pain) {create :symptom, description: "pain"}
	let!(:swelling) {create :symptom, description: "swelling"}
	#Create a few diagnosis (for admission+patient)
	let!(:patella_broken) {create :patella_fracture}
	let!(:patella_disloc) {create :patella_dislocation}
	let!(:meniscus_tear) {create :meniscus_tear}
	#Create a few diagnosis (for chronic conditions)
	let!(:diabetes) {create :diabetes}
	let!(:heart_murmur) {create :heart_murmur}
	let!(:high_bp) {create :high_bp}
	#Create a few allergies
	let!(:nuts) {create :allergy, description: "tree nuts"}
	let!(:latex) {create :allergy, description: "latex"}
	let!(:shellfish) {create :allergy, description: "shellfish"}
  let!(:admission1) {create :admission, patient: patient1, moment: DateTime.current}
    let!(:admission2) {create :admission, patient: patient2, moment: DateTime.current}
    let!(:admission3) {create :admission, patient: patient3, moment: DateTime.current}
    let!(:admission4) {create :admission, patient: patient4, moment: (DateTime.current-1.day)}
    #Add symptoms for admission
    let!(:p1_sym1) {create :admission_symptom, admission: admission1,  symptom: dizziness }
    let!(:p1_sym2) {create :admission_symptom, admission: admission1,  symptom: pain }
    let!(:p1_sym3) {create :admission_symptom, admission: admission1,  symptom: swelling }
    let!(:p2_sym1) {create :admission_symptom, admission: admission2,  symptom: dizziness }
    let!(:p2_sym2) {create :admission_symptom, admission: admission2,  symptom: pain }
    let!(:p3_sym1) {create :admission_symptom, admission: admission3,  symptom: dizziness }
    #Add diagnoses for admission
    let!(:p1_init_diag1) {create :admission_diagnosis, admission: admission1,  diagnosis: patella_broken }
    let!(:p1_init_diag2) {create :admission_diagnosis, admission: admission1,  diagnosis: patella_disloc }
    let!(:p1_init_diag3) {create :admission_diagnosis, admission: admission1,  diagnosis: meniscus_tear   }
    let!(:p2_init_diag1) {create :admission_diagnosis, admission: admission2,  diagnosis: patella_broken }
    let!(:p2_init_diag2) {create :admission_diagnosis, admission: admission2,  diagnosis: patella_disloc }
    let!(:p3_init_diag1) {create :admission_diagnosis, admission: admission3,  diagnosis: patella_broken }
    let!(:p4_init_diag1) {create :admission_diagnosis, admission: admission4,  diagnosis: patella_broken }
  	#Add observations
    let!(:p1_ob1) {create :observation, admission: admission1, description: "observation1"}
  	let!(:p1_ob2) {create :observation, admission: admission1, description: "observation2"}
  	let!(:p1_ob3) {create :observation, admission: admission1, description: "observation3"}
  	let!(:p2_ob1) {create :observation, admission: admission2, description: "observation1"}
  	let!(:p2_ob2) {create :observation, admission: admission2, description: "observation2"}
  	let!(:p3_ob1) {create :observation, admission: admission3, description: "observation1"}
	#Add allergies
		let!(:p1_all1) {create :patient_allergy, patient: patient1, allergy: nuts}   
		let!(:p1_all2) {create :patient_allergy, patient: patient1, allergy: latex}   
		let!(:p1_all3) {create :patient_allergy, patient: patient1, allergy: shellfish}
		let!(:p2_all1) {create :patient_allergy, patient: patient2, allergy: nuts}   
		let!(:p2_all2) {create :patient_allergy, patient: patient2, allergy: latex}   
		let!(:p3_all1) {create :patient_allergy, patient: patient3, allergy: nuts}   
		
		#Add chronic conditions
		let!(:p1_cc1) {create :patient_chronic_condition, patient: patient1, diagnosis: high_bp}
		let!(:p1_cc2) {create :patient_chronic_condition, patient: patient1, diagnosis: diabetes}
		let!(:p1_cc3) {create :patient_chronic_condition, patient: patient1, diagnosis: heart_murmur}
		let!(:p2_cc1) {create :patient_chronic_condition, patient: patient2, diagnosis: high_bp}
		let!(:p2_cc2) {create :patient_chronic_condition, patient: patient2, diagnosis: diabetes}
		let!(:p3_cc1) {create :patient_chronic_condition, patient: patient3, diagnosis: high_bp}
		
		#Add medications
		let!(:p1_aleve) {create :medication_order, patient: patient1, name: "Naproxen Sodium", dosage: 500, necessity: "reduce inflammation", route: :po }
		let!(:p1_aleve_freq) {create :order_frequency, medication_order: p1_aleve, value: "8"}
		let!(:p1_advil) {create :medication_order, patient: patient1, name: "Ibuprofen", dosage: 200, necessity: "manage pain", route: :im }
		let!(:p1_advil_freq) {create :order_frequency, medication_order: p1_advil, value: "6"}
		let!(:p1_tylenol) {create :medication_order, patient: patient1, name: "Acetaminophen", dosage: 200, necessity: "manage pain", route: :sc }
		let!(:p1_tylenol_freq) {create :order_frequency, medication_order: p1_tylenol, value: "4"}
		let!(:p2_aleve) {create :medication_order, patient: patient2, name: "Naproxen Sodium", dosage: 500, necessity: "reduce inflammation", route: :po }
		let!(:p2_aleve_freq) {create :order_frequency, medication_order: p2_aleve, value: "8"}
		let!(:p2_advil) {create :medication_order, patient: patient2, name: "Ibuprofen", dosage: 200, necessity: "manage pain", route: :im }
		let!(:p2_advil_freq) {create :order_frequency, medication_order: p2_advil, value: "6"}
		let!(:p3_aleve) {create :medication_order, patient: patient3, name: "Naproxen Sodium", dosage: 500, necessity: "reduce inflammation", route: :po }
		let!(:p3_aleve_freq) {create :order_frequency, medication_order: p3_aleve, value: "8"}
		#Add diagnostic procedures
		let!(:p1_xray) {create :diagnostic_procedure, patient: patient1, description: "x-ray of knee"}
		let!(:p1_mri) {create :diagnostic_procedure, patient: patient1, description: "mri of knee"}
		let!(:p1_ct_scan) {create :diagnostic_procedure, patient: patient1, description: "ct-scan of head"}
		let!(:p2_xray) {create :diagnostic_procedure, patient: patient2, description: "x-ray of knee"}
		let!(:p2_mri) {create :diagnostic_procedure, patient: patient2, description: "mri of knee"}
		let!(:p3_xray) {create :diagnostic_procedure, patient: patient3, description: "x-ray of knee"}
		let!(:p4_xray) {create :diagnostic_procedure, patient: patient4, description: "x-ray of knee"}

		#Add patient diagnostics
  	let!(:p1_diag1) {create :patient_diagnosis, patient: patient1,  diagnosis: patella_broken} 
  	let!(:p1_diag2) {create :patient_diagnosis, patient: patient1,  diagnosis: patella_disloc}
  	let!(:p1_diag3) {create :patient_diagnosis, patient: patient1,  diagnosis: meniscus_tear} 
  	let!(:p2_diag1) {create :patient_diagnosis, patient: patient2,  diagnosis: patella_broken} 
  	let!(:p2_diag2) {create :patient_diagnosis, patient: patient2,  diagnosis: patella_disloc} 
  	let!(:p3_diag1) {create :patient_diagnosis, patient: patient3,  diagnosis: patella_broken} 
  	let!(:p4_diag1) {create :patient_diagnosis, patient: patient4,  diagnosis: patella_broken} 
		 #Add treatments
	  let!(:p1_resetting) {create :treatment, patient: patient1, description: "resetting the bone in place", necessity: "allow it to heal in its proper place"}
		let!(:p1_brace) {create :treatment, patient: patient1, description: "immobilizing the bone in a brace", necessity: "reduce pain and discomfort"}
		let!(:p1_ice) {create :treatment, patient: patient1, description: "applied ice", necessity: "reduce swelling"}
		let!(:p2_resetting) {create :treatment, patient: patient2, description: "resetting the bone in place", necessity: "allow it to heal in its proper place"}
		let!(:p2_brace) {create :treatment, patient: patient2, description: "immobilizing the bone in a brace", necessity: "reduce pain and discomfort"}
		let!(:p3_resetting) {create :treatment, patient: patient3, description: "resetting the bone in place", necessity: "allow it to heal in its proper place"}

end