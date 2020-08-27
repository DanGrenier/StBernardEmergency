# KipuCodeChallenge

# Assumptions
  A few assumptions were made for this application
  Since I don't have a background in the medical field
  I don't know whether doctors and staff know the
  Diagnoses codes off the top of their head or not

  Is it quicker for staff to search for a specific
  Diagnosis code and select it or to just type it
  in their own word and then enter the code?

  I could see a few static tables such as
  Allergies, Symptoms and Diagnosis where
  the data is pre-populated and users can select
  from the values. Those 3 things have finite 
  number of elements so it makes sense to load them
  and perhaps keep them updated if the official list
  changes. 

  But I could be wrong. If the users prefer to enter
  the allergies, symptoms and diagnosis in their
  own words, then we'll just need to remove the
  joining tables between these entities and the 
  Admission and Patient models and have an admission
  or patient id directly in those tables and have
  a one to many relation.

  Other assumptions were that, an admitted patient could have no medication administered to them. Staff may not have observations to write. Staff may may not have treatments to perform. Patient may have no allergies and no prior chronic conditions

# Initial Analysis
  The first things that jumped at me was that the client was located in Europe. A ski resort in the Alps. The Alps are shared by many counrties. France, Italy, Germany, Switzerland, Austria and a few others. While english is universal, there is a chance that the client has ski resorts in more than one country and may want the application to show in that country's preferred language. This is why I went and internationalized the application with I18n and proceeded to test with at least 2 languages and date formats. English and French, which I am fluent in. That's where the question of importing static data vs having the staff enter the data in their own word may be an important one. The static data would have to be imported in the proper language or translated via I18n. As opposed to having staff enter the information in the chosen language and have it flow naturally with the summary which needs to be written in a narrated way.

  Currently as it stands, if you run the application in french, everything will be in french except for the symptoms, allergies and diagnoses which are
  static values that are loaded in english.

  A Gem like Globalize could be used to load the codes in english and then create a translation table for different locales.


# Database Structure
  Based on the choices made initially, The symptoms, allergies and diagnoses tables are tables that contain static data and are not directly linked to a patient or admission. You can associate one of these entity to a patient or admission via a joining table patient_id -> allergy_id , patient_id -> symptom_id. 

# Testing 
  I installed Rspec and Capybara for testing because I didn't want to fight with the test suite. I used FactoryBot to create default factories and use them throughout the testing suite. I created a shared context that creates 4 patients all with different numbers or symptoms, allergies, diagnostic procedures, treatments, medications and observations in order to test the human readable sentences that need to be generated for the emergency transfer form. I proceeded to create unit tests for the models that interact with the users and that generates the human readable text. Patient, Admission, DiagnosticProcedure, MedicationOrder, Treatment, Observation. I then proceeded to create one simple feature test that checks for the presence of the patient name when the form is rendered. This feature test can be greatly expanded and have more precision as we can use capybara css selectors to make sure the proper text appers in the proper elements on the form. A test with js:true and a headless browser also needs to be added since the Patient select box uses javascript to redirect to the emergency transfer form

# Running the App
  After cloning (or pulling) the changes. Run bundle install and then rails db:migrate. Running rspec should run all tests. Before starting the rails server, run rails db:reset in order to wipe the database and seed it.

  The application root lands on the Patient Selection screen where current patients are loaded into a select dropdown. Current patients are patients that were admitted today (admission date = today's date). Since most ski resort facilities don't keep patients over 24 hours it didn't make sense to list all patients or even patients for several days. However the scope could be widen to allow for showing 2 days in the event that a resort runs past midnight and someone is admitted before midnight but transferred after midnight. 

  After selecting a patient from the list, click on the transfer button. The transfer button uses javascript to retrieve the patient route hidden as a value in the select box and redirects to the show event in the EmergencyTransferSummary controller. The controller then retrieves the patient and shows the form. 

  The form in turn shows the information in the proper language (except for thos static values) and calls I18n attributes with parameters in order to insert the human readable sentences coming from the patient and admission models and generate a readable text.

  The print button will call a generic javascript send to printer. A print.css.scss stylesheet is loaded and used to make sure some artifacts are hidden from the print page such as color, links, urls and web page title.
