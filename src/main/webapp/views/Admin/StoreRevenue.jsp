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
    <table
		class="table table-light border-danger table-bordered table-striped">
		<div class="d-flex justify-content-center" style="width: 100%;">
			<div class="ms-5 text-light">Video title:</div>
			<select class="form-select ms-3" aria-label="Default select example" onchange="location.href=window.location.href.split('?')[0]+'?TabReport=2&videoId='+this.value">
				<option selected>Open this select menu</option>
				<c:forEach var="i" items="${titleVideo}">
					<option value="${i.getId()}" ${videoId==i.id?'selected':''}>${i.title}</option>
				</c:forEach>
			</select>
		</div>
		<thead>
			<tr>
				<th scope="col">Username</th>
				<th scope="col">Fullname</th>
				<th scope="col">Email</th>
				<th scope="col">Likedday</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${fvrt}">
				<tr>
					<th scope="row">${i.user.id}</th>
					<td>${i.user.email}</td>
					<td>${i.user.role}</td>
					<td>${i.likeDate}</td>
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