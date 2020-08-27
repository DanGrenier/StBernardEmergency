require 'rails_helper'

#This test can be expanded by using Capybara's
#CSS Selectors to really look for the proper text
#In the proper paragraphs
#For the purpose of this prototype, checking the 
#presence of the name in the data is enough for now

RSpec.feature "Viewing Patient Transfer Form", :type => :feature do 
  include_context "shared_factories"  
  
  scenario "User Can view a Patient Transfer Form " do 
    visit emergency_transfer_summary_path patient1
    expect(page).to have_content(patient1.last_name)
    
    visit emergency_transfer_summary_path patient2
    expect(page).to have_content(patient2.last_name)
  end


end
