class PatientJoiningTables < ActiveRecord::Migration[5.2]
  def change
  	create_table :patient_diagnoses do |t|
	  	t.integer :patient_id , null: false
	  	t.integer :diagnosis_id, null: false
	  end

	  create_table :patient_allergies do |t|
	  	t.integer :patient_id , null: false
	  	t.integer :allergy_id, null: false
	  end

	  create_table :patient_chronic_conditions do |t|
	  	t.integer :patient_id , null: false
	  	t.integer :diagnosis_id, null: false
	  end
  end
end
