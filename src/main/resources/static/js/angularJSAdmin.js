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

  // edit spec
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
//Load hinh
app.controller("myCtrlImage", function ($scope) {
  $scope.images = [];
  $scope.loadImages = function () {
    var files = $scope.selectedImages;
    $scope.images = []; // Xóa danh sách hình ảnh cũ
    for (var i = 0; i < files.length; i++) {
      var file = files[i];
      var reader = new FileReader();

      reader.onload = function (e) {
        var imageUrl = e.target.result;
        $scope.images.push(imageUrl);
        $scope.$apply();
      };
      console.log(files[i]);
      reader.readAsDataURL(file);
    }
  };
});
