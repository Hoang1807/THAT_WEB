<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="/html/style.css">
    <link rel="stylesheet" href="index.css">
    <title>Document</title>
</head>

<body class="bg-body-secondary">
<jsp:include page="../Admin/header.jsp"></jsp:include>
<main>
        <div class="container border border-3 mt-5 bg-light-subtle p-0 rounded-4 shadow">
            <form class="p-5">
                <legend>Manager Spec</legend>
                <div class="row">
                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">Spec key</label>
                        <input type="text" class="form-control" id="exampleInputPassword1">
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">Spec value</label>
                        <input type="text" class="form-control" id="exampleInputPassword1">
                    </div>
            </div>
                <div class="d-flex justify-content-end ">
                    <button type="submit" class="btn btn-success ms-2 rounded-3">Add</button>
                    <button type="submit" class="btn btn-success ms-2 rounded-3">Update</button>
                    <button type="submit" class="btn btn-danger ms-2 rounded-3">Reset</button>
                </div>
            </form>
        </div>
        <div
            class="container border border-3 mt-5 bg-light-subtle p-3 rounded-4 shadow table-responsive table-responsive-sm table-responsive-md table-responsive-lg">
            <span>(3)Records Found</span>
            <hr>
            <table class="table table-bordered border-3 text-black">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Spec key</th>
                        <th scope="col">Spec value</th>
                        <th scope="col">Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td><button><i class="bi bi-pencil-fill"></i></button></td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td><button><i class="bi bi-pencil-fill"></i></button></td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Larry the Bird</td>
                        <td>@twitter</td>
                        <td><button><i class="bi bi-pencil-fill"></i></button></td>
                    </tr>
                </tbody>
            </table>
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