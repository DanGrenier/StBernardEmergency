class CreateTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :treatments do |t|
     	t.references :patient, foreign_key: true, null: false
    	t.text :description
    	t.text :necessity

    end
  end
end
