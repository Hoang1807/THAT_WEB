// start AngularJS
var app = angular.module("myApp", []);

app.controller("myCtrl", function ($scope) {
  // edit category
  $scope.editCate = function (id, name) {
    $scope.cate = {
      id: id,
      name: name,
    };
  };
  $scope.editSpec = function (id, key, value) {
    $scope.spec = {
      id: id,
      key: key,
      value: value,
    };
  };

  // set role account
  $scope.account = {
    role: "true",
  };

  // edit account
  $scope.editAccount = function (phone, name, email, password, role) {
    $scope.account = {
      phone: phone,
      name: name,
      email: email,
      password: password,
      role: role,
    };
  };

  //edit producer
  $scope.editProducer = function (id, name, email, phone) {
    $scope.producer = {
      id: id,
      name: name,
      email: email,
      phone: phone,
    };
  };
});
// end AngularJS
