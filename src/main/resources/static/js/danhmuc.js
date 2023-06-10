
 function findDM(){
	 //lấy pramater
	

	var sapxep = $('select[name="sapXep"]').val();

	
	$.ajax({
			type: 'post',
			url: '/laptop/product/findGiaSP',
			data: {
				"sapxep": sapxep
			},
			success: function() {
				console.log(sapxep)
			},
			error: function() {
				alert("Error !!");
			}
		});
 }

 