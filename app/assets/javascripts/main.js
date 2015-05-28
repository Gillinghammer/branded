$(function() {

  // This is a simple *viewmodel* - JavaScript that defines the data and behavior of your UI
  function CompanyViewModel(email) {

    // Data
        this.email = ko.observable(email);
        this.editing = ko.observable(false);
             
        // Behaviors
        this.edit = function() { this.editing(true) }
  }

  var userId = $("body").data('current')
  $.getJSON("http://localhost:3000/users/" + userId, function(data) { 
    
    console.log(data.email)

    // Activates knockout.js
    ko.applyBindings(new CompanyViewModel(data.email));
   
      // Now use this data to update your view models, 
      // and Knockout will update your UI automatically 
  })

  

});
