class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
    	t.string :first_name, null: false
    	t.string :middle_name
    	t.string :last_name, null: false 
    	t.string :mr , null: false
    	t.datetime :dob , null: false
    	t.integer :gender, null: false
    end
  end
end
