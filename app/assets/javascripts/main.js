$(function() {

  var myViewModel = {
    id: ko.observable(0),
    email: ko.observable('test@test.com'),
    company: ko.observable('coke'),
    company_facebook: ko.observable('facebook_url'),
    company_twitter: ko.observable('twitter_handle')
  };
  ko.applyBindings(myViewModel);
  getLoggedInData($('body').data('current'))

  function getLoggedInData(userId) {
    $.getJSON("http://localhost:3000/users/" + userId, function(data) { 
      myViewModel.id(data.id).email(data.email).company(data.company).company_facebook(data.company_facebook).company_twitter(data.company_twitter)
    });
  };

  // Editable Text object:
  function EditableText(text, editable) {
      var self = this;
      self.text = ko.observable(text);
      self.editing = ko.observable(editable);
  };

});




