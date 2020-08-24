class CreateAllergies < ActiveRecord::Migration[5.2]
  def change
    create_table :allergies do |t|
    	t.string :description, null: false
    end
  end
end
