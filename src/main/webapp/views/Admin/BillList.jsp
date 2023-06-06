<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/MultipleSelect.css">
</head>
<body class="bg-body-secondary">
	<jsp:include page="../Admin/header.jsp"></jsp:include>
    <main>
        <div class="container border border-3 mt-5 bg-light-subtle p-0 rounded-4 shadow">
            <form class="p-5">
                <legend>Manager Bill</legend>
                <div class="row w-100 justify-content-between">
                        <div class="mb-3 col-lg-2 col-md-12 col-sm-12 me-2">
                            <label for="exampleInputPassword1" class="form-label">ID Bill</label>
                            <input type="text" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="mb-3 col-lg-4 col-md-12 col-sm-12 me-2">
                            <label for="exampleInputPassword1" class="form-label">Customer Phonenumber </label>
                            <input type="text" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="mb-3 col-lg-5 col-md-12 col-sm-12">
                            <label for="exampleInputPassword1" class="form-label">Bill Address</label>
                            <input type="text" class="form-control" id="exampleInputPassword1">
                        </div>
               
                </div>
                <div class="d-flex justify-content-end ">
                    <button type="submit" class="btn btn-success ms-2 rounded-3">search</button>
                    <button type="submit" class="btn btn-danger ms-2 rounded-3">reset</button>
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
                        <th scope="col">ID Bill</th>
                        <th scope="col">User Phonenumber</th>
                        <th scope="col">Address Operation</th>
                        <th scope="col">Date</th>
                        <th scope="col">More</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td><button><a href="/Bill/BillDetail" class="bi bi-three-dots"></a></button></td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                        <td><button><a href="/Bill/BillDetail" class="bi bi-three-dots"></a></button></td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Larry the Bird</td>
                        <td>@twitter</td>
                        <td>@fat</td>
                        <td><button><a href="/Bill/BillDetail" class="bi bi-three-dots"></a></button></td>
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
        <script type="/js/MultipleSelect.js"></script>
</body>
</html>