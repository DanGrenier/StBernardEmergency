FactoryBot.define do
  factory :order_frequency do 
    medication_order
    value {"1"}
    unit {:hour}
  end
end