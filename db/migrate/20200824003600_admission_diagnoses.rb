class AdmissionDiagnoses < ActiveRecord::Migration[5.2]
  def change
  	create_table :admission_diagnoses do |t|
    	t.integer :admission_id, null: false
    	t.integer :diagnosis_id, null: false
    end
  end
end
