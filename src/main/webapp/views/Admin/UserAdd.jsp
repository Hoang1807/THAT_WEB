<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/index.css">
</head>
<body class="bg-body-secondary">
	<jsp:include page="../Admin/header.jsp"></jsp:include>
	<main>
        <div class="container border border-3 mt-5 bg-light-subtle p-0 rounded-4 shadow">
            <form class="p-5">
                <legend>Manager User</legend>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Phonenumber</label>
                            <input type="text" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">User Name</label>
                            <input type="text" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="d-flex">
                            Roles:&ensp;
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1"
                                    value="option1">
                                <label class="form-check-label" for="inlineRadio1">User</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2"
                                    value="option2">
                                <label class="form-check-label" for="inlineRadio2">Admin</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">User Password</label>
                            <input type="text" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">User Email</label>
                            <input type="number" class="form-control" id="exampleInputPassword1">
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-end ">
                    <button type="submit" class="btn btn-success ms-2 rounded-3">save</button>
                    <button type="submit" class="btn btn-danger ms-2 rounded-3">delete</button>
                </div>
            </form>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
</body>
</html>