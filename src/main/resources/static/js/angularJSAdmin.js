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

//edit producer
app.controller("myCtrlProducer", function ($scope) {
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

