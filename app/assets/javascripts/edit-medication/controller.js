(function() {
    'use strict';
    angular.module('ellieGrid')
      .controller('EditMedicationController', EditMedicationController);

    EditMedicationController.$inject = [
      '$http'
    ];

    function EditMedicationController(
      $http
    ) {
      var self = this;
      self.currentMedications = [];
      self.currentlyEditing = {};

      self.initializeMedications = function() {
        return $http({
          url: '/read',
          method: 'GET'
        }).then(function(response) {
          console.log("Retrieved medications");
          console.log(response.data);
          self.currentMedications = response.data;
        });
      };

      self.edit = function(medication) {
        if (self.editing(medication)) {
          self.cancel();
        } else {
          self.currentlyEditing = medication;
        }
      };

      self.editing = function(medication) {
        return self.currentlyEditing === medication;
      };

      self.cancel = function() {
        return self.currentlyEditing = {};
      };

      self.save = function(medication) {
        console.log("Save medication");
        console.log(medication);
      };

    }
})();