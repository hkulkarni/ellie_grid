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
          self.currentMedications = response.data;
        });
      };

      self.edit = function(medication) {
        if (self.editing(medication)) {
          self.cancelEdit();
        } else {
          self.currentlyEditing = medication;
        }
      };

      self.editing = function(medication) {
        return self.currentlyEditing === medication;
      };

      self.cancelEdit = function() {
        return self.currentlyEditing = {};
      };

      self.save = function(medication) {
        console.log("Save medication");
        console.log(medication);
        self.cancelEdit();
        return $http({
          url: '/update',
          method: 'POST',
          data: angular.toJson(medication)
        }).then(function(response) {
          console.log("Updated medication information.");
        });
      };

    }
})();