class CreateObservations < ActiveRecord::Migration[5.2]
  def change
    create_table :observations do |t|
    	t.references :admission, null: false
    	t.datetime :moment, null: false 
    	t.text :description
    end
  end
end
