// start AngularJS
var app = angular.module("myApp", []);

// edit category
app.controller("myCtrl", function ($scope) {
  $scope.editCate = function (id, name) {
    $scope.cate = {
      id: id,
      name: name,
    };
  };
});
// end AngularJS
