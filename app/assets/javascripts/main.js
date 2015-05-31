$(function() {

  var companyViewModel = function(userId) {
    var self = this;
    self.company_id = ko.observable(1); 
    self.company_name = ko.observable('name');
    self.company_facebook = ko.observable('facebook');
    self.company_twitter = ko.observable('twitter');
    self.edit_mode = ko.observable(false);
    self.getCompanyInfo = function() {
      $.getJSON("http://localhost:3000/users/" + $('body').data('current'), function(company_data) {
          self.company_id(company_data.company_id);
          self.company_name(company_data.company_name);
          self.company_facebook(company_data.company_facebook);
          self.company_twitter(company_data.company_twitter);
          self.edit_mode(false);
      });
    }
    $( "#navigation" ).delegate( "#updateCompany", "click", function() {
      console.log(ko.toJSON(self))
      $.ajax({
        url: "http://localhost:3000/companies/" + self.company_id(),
        type: 'PUT',
        data: ko.toJSON(self),
        success: function(data) {
          console.log(data)
        }
      });
    });
    self.getCompanyInfo();
  };

  ko.applyBindings(new companyViewModel(), document.getElementById("navigation"));


});




