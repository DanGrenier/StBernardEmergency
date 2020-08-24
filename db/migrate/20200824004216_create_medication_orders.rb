class CreateMedicationOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :medication_orders do |t|
    	t.string :name, null: false 
    	t.integer :unit, null: false 
    	t.decimal :dosage, null: false, precision: 6, scale: 2, default: 0.00
    	t.integer :route , null: false
    	t.text :necessity
    end
  end
end
