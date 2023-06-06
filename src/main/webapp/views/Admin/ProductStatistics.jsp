<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="/html/style.css">
    <link rel="stylesheet" href="index.css">
    <title>Document</title>
</head>

<body class="bg-body-secondary">
    <table class="table table-light border-danger table-bordered table-striped">
		<div class="d-flex justify-content-center" style="width: 100%;">
            
			<div class="ms-5 text-light">Video title:</div>
			<select class="form-select ms-3" name="cboVideo"
				onchange="location.href=window.location.href.split('?')[0]+'?TabReport=3&videoId='+this.value"
				aria-label="Default select example">
				<option selected disabled value="">Open this select menu</option>
				<c:forEach var="i" items="${titleVideo}">
					<option value="${i.getId()}" ${videoId==i.id?'selected':''}>${i.title}</option>
				</c:forEach>
			</select>
		</div>
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">View Count</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${report}">
				<tr>
					<th scope="row">${i.getGroup()}</th>	
					<td>${i.getCountNumber()}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
</body>

</html>