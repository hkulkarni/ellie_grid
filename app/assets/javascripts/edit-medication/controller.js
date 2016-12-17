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
          url: '/send_reminders',
          method: 'POST'
        }).then(function(response) {
          console.log("reminders sent");
          console.log(response);
        });
      };

    }
})();