# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_24_005121) do

  create_table "admission_diagnoses", force: :cascade do |t|
    t.integer "admission_id", null: false
    t.integer "diagnosis_id", null: false
  end

  create_table "admission_symptoms", force: :cascade do |t|
    t.integer "admission_id", null: false
    t.integer "symptom_id", null: false
  end

  create_table "admissions", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.datetime "moment", null: false
    t.index ["patient_id"], name: "index_admissions_on_patient_id"
  end

  create_table "allergies", force: :cascade do |t|
    t.string "description", null: false
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "coding_system", null: false
    t.string "code", null: false
    t.text "description", null: false
  end

  create_table "diagnostic_procedures", force: :cascade do |t|
    t.text "description", null: false
    t.datetime "moment", null: false
    t.integer "patient_id", null: false
    t.index ["patient_id"], name: "index_diagnostic_procedures_on_patient_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "medication_orders", force: :cascade do |t|
    t.string "name", null: false
    t.integer "unit", null: false
    t.decimal "dosage", precision: 6, scale: 2, default: "0.0", null: false
    t.integer "route", null: false
    t.text "necessity"
    t.integer "patient_id", null: false
    t.index ["patient_id"], name: "index_medication_orders_on_patient_id"
  end

  create_table "observations", force: :cascade do |t|
    t.integer "admission_id", null: false
    t.datetime "moment", null: false
    t.text "description"
    t.index ["admission_id"], name: "index_observations_on_admission_id"
  end

  create_table "order_frequencies", force: :cascade do |t|
    t.string "value", null: false
    t.integer "unit", null: false
    t.integer "medication_order_id", null: false
    t.index ["medication_order_id"], name: "index_order_frequencies_on_medication_order_id"
  end

  create_table "patient_allergies", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "allergy_id", null: false
  end

  create_table "patient_chronic_conditions", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "diagnosis_id", null: false
  end

  create_table "patient_diagnoses", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "diagnosis_id", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.string "mr", null: false
    t.datetime "dob", null: false
    t.integer "gender", null: false
  end

  create_table "symptoms", force: :cascade do |t|
    t.text "description", null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.text "description"
    t.text "necessity"
    t.index ["patient_id"], name: "index_treatments_on_patient_id"
  end

end
