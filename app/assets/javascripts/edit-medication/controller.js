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
      self.currentlyCreating = false;
      self.newMedication = {
        name: '',
        time: ''
      }

      self.initializeMedications = function() {
        return $http({
          url: '/read',
          method: 'GET'
        }).then(function(response) {
          console.log("Retrieved medications");
          self.currentMedications = response.data;
        });
      };

      // Edit logic

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
        if (invalidInput(medication)) {
          console.log("Medication cannot be empty!");
          return;
        }
        self.cancelEdit();
        return $http({
          url: '/update',
          method: 'POST',
          data: angular.toJson(medication)
        }).then(function(response) {
          console.log("Updated medication information.");
        });
      };

      // Create logic

      self.createMode = function() {
        return self.currentlyCreating = !self.currentlyCreating;
      };

      self.create = function(medication) {
        if (invalidInput(medication)) {
          console.log("Medication cannot be empty!");
          return;
        }
        self.createMode();
        return $http({
          url: '/create',
          method: 'POST',
          data: angular.toJson(medication)
        }).then(function(response) {
          console.log("Created medication information.");
        });
      };

      function invalidInput(medication) {
        return medication.time === '' || medication.name === ''
      }

    }
})();