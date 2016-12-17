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

      self.initializeForms = function() {
        console.log("Initialized!");
        return $http({
          url: '/create',
          method: 'POST'
        }).then(function(response) {
          console.log("medication created");
          console.log(response);
        });
      };

    }
})();