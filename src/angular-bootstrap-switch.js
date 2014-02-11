'use strict';

angular.module('fiftyk').directive('bootstrapSwitch', ['$parse', function($parse){
  var linker = function($scope, el, attrs){
    var model = $parse(attrs.ngModel);

    el.bootstrapSwitch().on('switch-change', function(e, data){
      if(model){
        model.assign(scope, el.bootstrapSwitch('state'));
      }

      try{
        $scope.$digest();
      }catch(e){
        //console.log('...');
      }
    });

    $scope.$watch(attrs.ngModel, function(){
      var bool = model ? model($scope) : false;
      el.bootstrapSwitch('setState', bool);
    });

    $scope.$on('$destroy', function () {
      el.bootstrapSwitch('destroy');
    });

    return {
      restrict: 'C',
      link: linker
    }
  };
}]);