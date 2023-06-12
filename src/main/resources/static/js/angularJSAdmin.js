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
	$scope.editSpec = function (id, key, value) {
		$scope.spec = {
			id: id,
			key: key,
			value: value,
		};
	};
	
});
// end AngularJS
//Load hinh
app.controller("myCtrlImage", function($scope) {
	$scope.images = [];
	$scope.loadImages = function() {
	  var files = $scope.selectedImages;
	  $scope.images = []; // Xóa danh sách hình ảnh cũ
	  for (var i = 0; i < files.length; i++) {
		var file = files[i];
		var reader = new FileReader();

		reader.onload = function(e) {
		  var imageUrl = e.target.result;
		  $scope.images.push(imageUrl);
		  $scope.$apply();
		};
		console.log(files[i])
		reader.readAsDataURL(file);
	  }
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
