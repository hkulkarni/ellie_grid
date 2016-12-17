(function() {
    'use strict';

    angular.module('ellieGrid')
      .directive('editMedication', section);

    section.$inject = [];

    function section() {
      return {
        restrict: 'E',
        scope: true, 
        templateUrl: 'edit_medication.html',
        controller: 'EditMedicationController',
        controllerAs: 'editMedication',
        link: function(scope, element, attributes, controller) {
          controller.initializeMedications();
        }
      };
    }

})();