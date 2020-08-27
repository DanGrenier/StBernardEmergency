require 'rails_helper'

RSpec.feature "Viewing Patient Transfer Form", :type => :feature do 
  include_context "shared_factories"  
  
  scenario "User Can view a Patient Transfer Form " do 
    visit emergency_transfer_summary_path patient1
    
    
    expect(page).to have_content(patient1.last_name)
    
  end


end
