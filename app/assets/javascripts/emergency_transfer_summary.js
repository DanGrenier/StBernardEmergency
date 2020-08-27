
//Function that is called when clicking the
//Transfer button after selecting a patient
//It simply retrieves the path associated
//with the patient in the select box and redirects
//the user there.
function redirectToShow(){
	val = $("#id").val();
  window.location = val;
}