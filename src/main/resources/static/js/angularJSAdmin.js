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
app.controller("myCtrlProduct",function($scope,$http){
	$scope.editProduct=function(id,name,price,quantity,producerId,categoryId){
		var data=id
		$scope.product={
			id:id,
			name:name,
			price:parseFloat(price),
			quantity:parseInt(quantity),
			producerId:producerId,
			categoryId:categoryId,
		};
		console.log(data)
		$http.post('/admin/manager-product/listSpec/'+ data)
		.then(function(response) {
			$scope.product.specs= response.data
			$scope.isSelectedSpec = function(specId) {
				return $scope.product.specs.includes(specId);
			};
		  })
		  .catch(function(error) {
			// Xử lý lỗi nếu có
			console.error(error);
		  });
		$http.post('/admin/manager-product/listImg/' + data)
		.then(function(response) {
			 // Nhận phản hồi từ backend controller
			$scope.product.images=response.data;
			console.log($scope.product.images)
		  })
		  .catch(function(error) {
			// Xử lý lỗi nếu có
			
		  });
	}
})