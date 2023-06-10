function findDM() {
	var category = [];
	var danhmuc = $('input[name="cagetory"]').val();
	category.push(danhmuc);
  
	$.ajax({
	  type: 'post',
	  url: '/laptop/product/findGiaSP',
	  data: {
		"danhmuc": danhmuc,
		"category": category,
	  },
	  success: function() {
		console.log(danhmuc);
	  },
	  error: function() {
		alert("Error!!");
	  }
	});
  }
  
  function sort() {
	var sapxep = $('select[name="sapXep"]').val();
  
	$.ajax({
	  type: 'post',
	  url: '/laptop/product/findGiaSP',
	  data: {
		"sapxep": sapxep,
	  },
	  success: function() {
		console.log(sapxep);
	  },
	  error: function() {
		alert("Error!!");
	  }
	});
  }
  