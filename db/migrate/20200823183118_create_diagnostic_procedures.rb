class CreateDiagnosticProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :diagnostic_procedures do |t|
    	t.text :description, null: false
  	  t.datetime :moment, null: false
  	  t.references :patient, foreign_key: true, null: false
    end
  end
end
