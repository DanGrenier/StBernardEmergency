class AddPatientToMedication < ActiveRecord::Migration[5.2]
  def change
  	add_column :medication_orders, :patient_id, :integer
  	change_column :medication_orders, :patient_id, :integer, null: false
  	add_index(:medication_orders, :patient_id)
  end
end
