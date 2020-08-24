class CreateSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :symptoms do |t|
    	t.text :description , null: false
    end
  end
end
