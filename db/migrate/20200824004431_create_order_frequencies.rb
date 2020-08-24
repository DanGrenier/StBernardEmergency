class CreateOrderFrequencies < ActiveRecord::Migration[5.2]
  def change
    create_table :order_frequencies do |t|
    	t.string :value, null: false
    	t.integer :unit, null: false
    	t.references :medication_order, foreign_key: true, null: false
    end
  end
end
