class CreateAdmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :admissions do |t|
    	t.references :patient, foreign_key: true, null: false 
    	t.datetime :moment, null: false 
    end
  end
end
