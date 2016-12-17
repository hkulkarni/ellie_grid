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

      self.initializeForms = function() {
        console.log("Initialized!");
        return $http({
          url: '/read',
          method: 'GET'
        }).then(function(response) {
          console.log("retrieved medications");
          console.log(response.data);
          self.currentMedications = response.data;
        });
      };

    }
})();